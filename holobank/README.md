# HoloBank


## Introduction

# Quick start

## Steps to prepare demo

### Prerequisites
Install Docker and npm.

Ensure you have an EE license key as an environment variable e.g. in your `.zshrc` or `.bashrc` file add a line like this:

```
export HASURA_GRAPHQL_EE_LICENSE_KEY=eyJhbGciOiJS...
```

### Install

```
# Close the repo
git clone git@github.com:typhonius/archetype.git

# Copy example.env to .env and alter values if applicable
cp example.env .env

# Install node dependencies for the React website
npm i

# Start the development server and instantiate the React website
npm run start

# In a new terminal window
# Download docker containers and start them
docker compose up

# In a new terminal window
# Reset the demo to a 'tabula rasa'
./scripts/demo.sh reset

# In order to install metadata for the accounts page
./scripts/demo.sh accounts

# In order to install metadata for the loyalty page
./scripts/demo.sh loyalty

# In order to install metadata for home loans
./scripts/demo.sh remote

# In order to install metadata for everything all at once
./scripts/demo.sh full
```

## Important URLs/Credentials

| Name | URL | Credentials |
|------|-----|-------------|
|  Nginx    | http://localhost:8181    |   myadminsecretkey1          |
|  Hasura (Main)    |  http://localhost:8111   |     myadminsecretkey1        |
|  Hasura (Remote)    |  http://localhost:8112   |     myadminsecretkey1        |
|  Grafana    |  http://localhost:3000   |     admin:admin        |
|  HoloBank (React Frontend)    |  http://localhost:3226  |            |

# Architecture

## Docker

The Docker compose file in the root of the project defines the containers which power the demo. In general for local use, containers will be used for everything _but_ the React App. React will mainly run natively on the computer to allow for easy editing as part of the demo. There exists the provision to deploy React as is done on holobank.app should that be desired.

React has been commented out as it is the assumption that demos will include some degree of changing the React app in real time.

## Containers

### Hasura

@TODO

### NGINX

NGINX is the main entrypoint to the demo. Pretty much everything externally facing should be going through NGINX. We expose NGINX on port 8181 locally. NGINX then uses a bunch of proxy pass directives to route requests to backend services (all on different docker containers using internal DNS addresses e.g. hasura:8111)

NGINX also uses NJS to run specific JavaScript operations (by LARPing as a webhook). We do this for a couple of reasons:
* To provision JWT tokens
* ~~To mask credit card information (in lieu of logical models)~~

### Postgres

We have 2 postgres dbs set up for this demo. One is for the main accounts information, the other for loyalty database information.

### MongoDB

TBA

### Redis

Redis is installed and used for caching where appropriate. At present there is some caching as part of the demo so it may be shown as needed.

### Volumes

@TODO

### Data Connector
Used for allowing new databases to be added. By default, 

## Website/React App
This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app) to provide a basic framework for the demo website.

## Logging, Metrics, Observability

### Prometheus

### OpenTelemetry

### Promtool

### Loki

### Grafana


## Local set-up


### `npm run start`

Runs the app in the development mode.\
Open [http://localhost:3226](http://localhost:3226) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!


## Metadata

Two different sets of metadata exist in the `cli` directory. The default metadata is also stored in `vanilla-metadata` for use in scripts to do rapid resets of the environment. Unless there's a good reason, `cli/metadata` should match what's in the vanilla directory within the git repo and at all times not actively demoing or developing.

The `loyaltydb` metadata has additional metadata which is applied on top of `blank` to provide access to an additional database with points content and customer data.

If additional metadata needs to be written, it should be added in a similar way and `demo.sh` should be edited accordingly. Currently there are 4 sets of metadata that each contribute to one vignette or another:

* reset: This provides a(n almost completely) blank slate. Useful for showing an initial set-up and for tracking dbs and tables etc
* account: This configures metadata for the first example (creating accounts/transactions etc)
* loyalty: This configures metadata for points/loyalty as well as the authz example
* remote: This adds in a secondary Hasura, adds REST APIs to it, makes it a remote schema of the first Hasura and creates REST endpoints on the primary Hasura for home loans examples
* full: Easy way to apply all of the above


## Scripts

In the project directory, there is a scripts directory with utility scripts to either help demos to go more smoothly, or to provide information for use debugging.

### jwt.js

Creates JWTs for use in the app or using something like Insomnia. This uses the default of user id 3 and user role user, however each of these can be changed with command line arguments. This script is useful for when a new bearer token is needed for calling the API directly or to demonstrate what is in a token on jwt.io

`node ./scripts/jwt.js -r user -u 5`

### demo.sh

If more metadata is required, this script will likely need refactoring to allow for simple choice of metadata e.g. `./scripts/demo.sh full`

Parameters for use with `demo.sh` are defined above in the metadata section.

### db_dump.sh

Allows for changes made to either of the databases to be dumped back into the codebase for easy reinstantiation at a later date.

### load_db.sh

If something has gone dramatically wrong with the dbs, we can install from the dump in the database. This will destroy any changes though so fair warning applies.

### crypto.js

WIP - this will be useful for encrypting and decrypting (two-way) content as part of the ability to run through a webhook to encrypt or decrypt data on the fly before it enters/after it leaves the database.

## Development

## Deployment

## holobank.app Version
There is a version deployed to a server online which provides an up-to-date version of _Archetype_ for use if local versions do not work.

## Important URLs/Credentials

| Name | URL | Credentials |
|------|-----|-------------|
|  Hasura (Main)    | https://api.holobank.app    |   myadminsecretkey1          |
|  Hasura (Remote)    | https://remoteapi.holobank.app    |   myadminsecretkey1          |
|  Grafana    |  https://grafana.holobank.app   |     admin:admin        |
|  HoloBank (React Frontend)    |  https://holobank.app  |            |
