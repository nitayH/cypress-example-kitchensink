# image has Cypress npm module installed globally in /root/.npm/node_modules
# and Cypress binary cached in /root/.cache/Cypress folder
FROM cypress/included:latest

ARG BUILDKITE_BUILD_CHECKOUT_PATH
ARG BUILDKITE_BUILD_ID
ARG BUILDKITE_PIPELINE_NAME
ARG BUILDKITE_LABEL
ARG BUILDKITE_BRANCH
ARG BUILDKITE_COMMIT
ARG BUILDKITE_PULL_REQUEST
ARG BUILDKITE_PULL_REQUEST_BASE_BRANCH
ARG BUILDKITE_PARALLEL_JOB_COUNT

ENV BUILDKITE_BUILD_CHECKOUT_PATH ${BUILDKITE_BUILD_CHECKOUT_PATH}
ENV BUILDKITE_BUILD_ID ${BUILDKITE_BUILD_ID}
ENV BUILDKITE_PIPELINE_NAME ${BUILDKITE_PIPELINE_NAME}
ENV BUILDKITE_LABEL ${BUILDKITE_LABEL}
ENV BUILDKITE_BRANCH ${BUILDKITE_BRANCH}
ENV BUILDKITE_COMMIT ${BUILDKITE_COMMIT}
ENV BUILDKITE_PULL_REQUEST ${BUILDKITE_PULL_REQUEST}
ENV BUILDKITE_PULL_REQUEST_BASE_BRANCH ${BUILDKITE_PULL_REQUEST_BASE_BRANCH}
ENV BUILDKITE_PARALLEL_JOB_COUNT ${BUILDKITE_PARALLEL_JOB_COUNT}

RUN mkdir /app 
COPY . /app/

WORKDIR /app

RUN chmod 777 scripts/read_envs.sh
RUN scripts/read_envs.sh

# Install dependencies
RUN apt-get install python-pip
RUN pip install redefine --index-url https://redefine.dev/pip/
RUN redefine verify --pytest

# RUN npm install --save-dev cypress
RUN npm run test

ENTRYPOINT ["./entrypoint.sh"]

