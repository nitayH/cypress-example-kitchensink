#!/bin/bash

# echo "--- Node version"
# node --version

# echo "--- NPM version"
# npm --version

# echo "--- Cypress version"
# npx cypress --version

# echo "--- Env vars"
# chmod 777 scripts/read_envs.sh
# scripts/read_envs.sh

# echo "--- Installing npm packages"
# npm install --save-dev
# npm install

npm install cypress@10.10

# Install redefine in the worker
pip3 install -U redefine --index-url https://redefine.dev/pip/

# Export the redefine_session_id created in the orchestrator
export REDEFINE_SESSION_ID=$(cat redefine/session_id.txt)

# Configure and start redefine
redefine config set stable_branch=master
redefine start --verbose --cypress --worker

# the full spec list provided by redefine exists in redefine/specs.txt
# run your current logic to select tests for the specific worker
# based on BUILDKITE_PARALLEL_JOB, and BUILDKITE_PARALLEL_JOB_COUNT
# and pass the list of specs for the current worker to cypress.



