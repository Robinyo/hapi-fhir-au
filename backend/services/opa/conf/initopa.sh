#! /usr/bin/env sh
set -e
set -x

export OPA_SERVICE_HOST=${OPA_SERVICE_HOST:-opa}
export OPA_SERVICE_ADMIN_PORT=${OPA_SERVICE_ADMIN_PORT:-8181}

CURL_OPTS="--silent --show-error --fail"

# Clean up
# curl $CURL_OPTS -XDELETE "http://${OPA_SERVICE_HOST}:${OPA_SERVICE_ADMIN_PORT}/v1/policies/example" || true

# curl $CURL_OPTS -XDELETE "http://${OPA_SERVICE_HOST}:${OPA_SERVICE_ADMIN_PORT}/v1/data/users" || true

# Policy
policyData=$(cat /organization.rego)
curl $CURL_OPTS -XPUT "http://${OPA_SERVICE_HOST}:${OPA_SERVICE_ADMIN_PORT}/v1/policies/example" \
--header 'Content-Type: text/plain' \
--data-raw "$policyData"
# Used --data-raw to avoid "rego_parse_error" "unexpected eof token"

# Data
# curl $CURL_OPTS -XPUT "http://${OPA_SERVICE_HOST}:${OPA_SERVICE_ADMIN_PORT}/v1/data/users" \
# --header 'Content-Type: application/json' \
# --data @/rbac.json
