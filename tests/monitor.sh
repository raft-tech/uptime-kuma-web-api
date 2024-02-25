#!/bin/bash

BASE_URL="http://kuma-rest.df.local"

TOKEN=$(curl -s -X 'POST' \
  "${BASE_URL}/login/access-token" \
  -H 'accept: application/json' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'grant_type=&username=admin&password=1234qwer&scope=&client_id=&client_secret=' | jq -r ".access_token")

echo "Token: ${TOKEN}"

echo "Get all monitor pages:"
TOKEN="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MDg4MzIzNTAsInN1YiI6ImV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeWJtRnRaU0k2SW1Ga2JXbHVJaXdpYUNJNkltUTJZakk1WW1OaE16WTNNV1EwT1RreU9UYzNZMlptWVRZek9XVTROVE0xSWl3aWFXRjBJam94TnpBNE9ESTJPVFV3ZlEuaHpXbXRDS3JBS1NpbVhhMXBHMDk1OXNuZUNRY05BWWhaX3FFdk4teHhrOCJ9.dnhCURkwzQNh40RCCNzk8uQ7Q3ebBk5GUOgQxskjIvQ"
curl -s -L -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" "${BASE_URL}/monitors"
