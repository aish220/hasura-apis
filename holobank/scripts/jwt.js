const crypto = require('crypto');
const jwt = require('jsonwebtoken');
const { program } = require('commander');

// Parse command line options
program
  .option('-r, --roles <roles>', 'Comma-separated list of roles')
  .option('-u, --userId <userId>', 'User ID')
  .parse(process.argv);

// Extract values from command line options or use default values
const options = program.opts();
const roles = options.roles ? options.roles.split(',') : ['user'];
const userId = options.userId ? options.userId : '3';

const claims = {
  "x-hasura-allowed-roles": roles,
  "x-hasura-default-role": roles[0],
  "x-hasura-user-id": userId
}

const key = 'hasura-hs384-secret-vbD*K2y!HXr7@zJ9oLmEJpNtWc.gwQY';

// Generate a new JWT token with the private key
const token = jwt.sign({ "iss": "keybase-customer", 'https://hasura.io/jwt/claims': claims }, key, { algorithm: 'HS256', expiresIn: '1y' });

console.log(`Token: ${token}`);
const decoded = jwt.verify(token, key);
console.log(decoded);
