async function generate_hs256_jwt(init_claims, key, valid) {
  let header = { typ: "JWT", alg: "HS256" };
  let claims = Object.assign(init_claims, {
    exp: Math.floor(Date.now() / 1000) + valid,
  });

  let s = [header, claims]
    .map(JSON.stringify)
    .map((v) => Buffer.from(v).toString("base64url"))
    .join(".");

  let wc_key = await crypto.subtle.importKey(
    "raw",
    key,
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign"]
  );
  let sign = await crypto.subtle.sign({ name: "HMAC" }, wc_key, s);

  return s + "." + Buffer.from(sign).toString("base64url");
}

async function jwt(r) {
  let userId = r.headersIn["X-Hasura-User-Id"] || 3;

  let claims = {
    "iss": "keybase-customer",
    "https://hasura.io/jwt/claims": {
      "x-hasura-allowed-roles": ["user"],
      "x-hasura-default-role": "user",
      "x-hasura-user-id": userId,
    },
  };

  let jwtv = await generate_hs256_jwt(claims, process.env.JWT_GEN_KEY, 604800);
  r.setReturnValue(jwtv);
}

async function jwt2user(r) {
  let authHeader = r.headersIn["Authorization"];

  let token;

  if (authHeader && authHeader.startsWith("Bearer ")) {
    token = authHeader.substring(7, authHeader.length);
  } else {
    r.return(500, "No token.");
  }

  try {
    let claims = jwt_decode(token);
    r.setReturnValue(JSON.stringify(claims["https://hasura.io/jwt/claims"]["x-hasura-user-id"]));
  } catch (e) {
    r.return(500, 'Invalid token.');
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

export default { jwt, jwt2user };
