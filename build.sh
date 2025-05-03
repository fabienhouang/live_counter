#!/usr/bin/env bash
# exit on error
set -o errexit

mix deps.get --only prod
MIX_ENV=prod mix compile
MIX_ENV=prod mix phx.digest

cd assets && npm install && npm run deploy
cd ..


