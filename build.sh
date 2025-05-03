#!/usr/bin/env bash
# exit on error
set -o errexit

mix deps.get --only prod
MIX_ENV=prod mix compile

cd assets && npm install && npm run deploy
cd ..

MIX_ENV=prod mix phx.digest
