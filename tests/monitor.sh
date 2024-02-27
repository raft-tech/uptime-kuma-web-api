#!/bin/bash

BASE_URL="http://kuma-rest.df.local"

TOKEN=$(curl -s -X 'POST' \
  "${BASE_URL}/login/access-token" \
  -H 'accept: application/json' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'grant_type=&username=admin&password=1234qwer&scope=&client_id=&client_secret=' | jq -r ".access_token")

echo "Token: ${TOKEN}"

echo "Get all monitor pages:"
curl -s -L -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" "${BASE_URL}/monitors"
