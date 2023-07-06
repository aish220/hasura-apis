function maskCreditCardNumber(cardNumber) {
  const maskedNumber = cardNumber.slice(0, -4).replace(/./g, "*");
  return maskedNumber + cardNumber.slice(-4);
}

function decryptCreditCardNumber(encCardNumber) {
  return (async () => {

    const keyString = 'hasura-hs384-secret-vbD*K2y!HXr7@zJ9oLmEJpNtWc.gwQY';
    const ivString = 'J4m$p+o?Hq#6A3r5';

    // const keysha256 = crypto.createHash('sha256').update(keyString).digest().slice(0, 16);
    // const iv = crypto.createHash('sha256').update(ivString).digest().slice(0, 16);
    const keyb64 = 'NtaoMQQR//0BY5pGfe7i6g==';
    const ivb64 = 'BCGu8ErDzS9Amr49gDwZLA==';

    const keyBuffer = Buffer.from(keyb64, 'base64');
    const keyArrayBuffer = keyBuffer.buffer.slice(keyBuffer.byteOffset, keyBuffer.byteOffset + keyBuffer.byteLength);

    const encoder = new TextEncoder();
    const key = encoder.encode(keyString);
    const iv = encoder.encode(ivString);

    const cryptoKey = await crypto.subtle.importKey(
      'raw',
      keyArrayBuffer,
      { name: 'AES-CBC' },
      false,
      ['encrypt', 'decrypt']
    );

    const alg = { name: 'AES-CBC', iv: iv }

    const cipher = Buffer.from(encCardNumber, 'base64');
    const decrypt = await crypto.subtle.decrypt(alg, cryptoKey, cipher);
    const decryptedBuffer = Buffer.from(decrypt);
    const decrypted = decryptedBuffer.toString();
    return decrypted
  })();
}

async function cards(r) {
  const adminHeader = r.headersIn["X-Hasura-Admin-Secret"];
  const authHeader = r.headersIn["Authorization"];

  let token;
  let admin = false;
  if (adminHeader && adminHeader === process.env.HASURA_ADMIN_KEY) {
    admin = true;
  } else if (authHeader && authHeader.startsWith("Bearer ")) {
    token = authHeader.substring(7, authHeader.length);
  } else {
    r.return(500, "No token.");
  }

  try {
    let graphqlQuery = {};
    if (admin) {
      graphqlQuery = {
        query: `query getCreditCards { credit_cards { id number expiry CVV accountId balance number_enc } }`,
      };
    } else {
      let userId = "";
      try {
        let claims = jwt_decode(token);
        userId = JSON.stringify(
          claims["https://hasura.io/jwt/claims"]["x-hasura-user-id"]
        );
      } catch (e) {
        r.return(500, e);
      }
      graphqlQuery = {
        query: `query getCreditCards { credit_cards(where: {account: {user_accounts: {user_id: {_eq: ${userId}}}}}) { id number expiry CVV accountId balance number_enc }}`,
      };
    }

    const body = JSON.stringify(graphqlQuery);

    let subrequest = await r
      .subrequest("/internal/creditcard-service", {
        method: "POST",
        body: body,
      })
      .then(async (reply) => {
        const parsedResponse = JSON.parse(reply.responseBody);

        await Promise.all(parsedResponse.data.credit_cards.map(async (card) => {
          card.number = maskCreditCardNumber(card.number);
          card.decNumber = await decryptCreditCardNumber(card.number_enc);
        }));


        return JSON.stringify(parsedResponse);
      })
      .catch((e) => r.return(500, e));

    r.return(200, subrequest);
  } catch (e) {
    r.return(500, e);
  }
}

function jwt_decode(token) {
  const key = process.env.JWT_GEN_KEY;
  // check token
  if (!token) {
    throw new Error("No token supplied");
  }
  // check segments
  var segments = token.split(".");
  if (segments.length !== 3) {
    throw new Error("Not enough or too many segments");
  }

  // All segment should be base64
  var headerSeg = segments[0];
  var payloadSeg = segments[1];
  var signatureSeg = segments[2];

  // base64 decode and parse JSON
  var header = JSON.parse(base64urlDecode(headerSeg));
  var payload = JSON.parse(base64urlDecode(payloadSeg));

  // verify signature. `sign` will return base64 string.
  var signingInput = [headerSeg, payloadSeg].join(".");
  if (!verify(signingInput, key, signatureSeg)) {
    throw new Error("Signature verification failed");
  }

  // Support for nbf and exp claims.
  // According to the RFC, they should be in seconds.
  if (payload.iat && Date.now() < payload.iat * 1000) {
    throw new Error("Token not yet active");
  }

  if (payload.exp && Date.now() > payload.exp * 1000) {
    throw new Error("Token expired");
  }

  return payload;
}
function verify(input, key, signature) {
  return signature === sign(input, key);
}

function sign(input, key) {
  var base64str;
  base64str = require("crypto")
    .createHmac("sha256", key)
    .update(input)
    .digest("base64");

  return base64urlEscape(base64str);
}

function base64urlDecode(str) {
  return Buffer.from(base64urlUnescape(str), "base64").toString();
}

function base64urlUnescape(str) {
  str += new Array(5 - (str.length % 4)).join("=");
  return str.replace(/\-/g, "+").replace(/_/g, "/");
}

function base64urlEscape(str) {
  return str.replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, "");
}

export default { cards };
