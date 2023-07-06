const crypto = require('crypto');

function encryptDecryptValue(action, value) {
  return (async () => {
    const keyString = 'hasura-hs384-secret-vbD*K2y!HXr7@zJ9oLmEJpNtWc.gwQY';
    const ivString = 'J4m$p+o?Hq#6A3r5';

    const keyb64 = 'NtaoMQQR//0BY5pGfe7i6g==';

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

    const alg = { name: 'AES-CBC', iv: iv };

    if (action === 'encrypt') {
      const plaintextArrayBuffer = encoder.encode(value);
      const encryptedData = await crypto.subtle.encrypt(alg, cryptoKey, plaintextArrayBuffer);
      const encryptedBuffer = Buffer.from(encryptedData);
      const encryptedBase64 = encryptedBuffer.toString('base64');
      return encryptedBase64;
    } else if (action === 'decrypt') {
      const cipher = Buffer.from(value, 'base64');
      const decrypt = await crypto.subtle.decrypt(alg, cryptoKey, cipher);
      const decryptedBuffer = Buffer.from(decrypt);
      const decrypted = decryptedBuffer.toString();
      return decrypted;
    } else {
      throw new Error('Invalid action. Please specify either "encrypt" or "decrypt".');
    }
  })();
}

// Extract command line arguments
const [, , action, value] = process.argv;

encryptDecryptValue(action, value)
  .then((result) => {
    console.log(`Result (${action}):`, result);
  })
  .catch((error) => {
    console.error(error);
  });