#!/bin/bash

USERNAME=$1
REPO="datamove/linux-git2"
API_URL="https://api.github.com"
TEMP_FILE="/tmp/pulls_data_kmraf.json"
rm -f "$TEMP_FILE"
PAGE=1
TOKEN="Authorization: token "`cat "/home/users/kmraf/public_repo_token"`

while true; do

    RESPONSE=$(curl -s -H "$TOKEN" "$API_URL/repos/$REPO/pulls?state=all&per_page=100&page=$PAGE")
    if [ $(echo "$RESPONSE" | jq 'length') -eq 0 ]
    then
        break
    fi
    echo "$RESPONSE"  | jq --arg USER $USERNAME '.[] | select(.user.login == $USER)' >> "$TEMP_FILE"
    PAGE=$((PAGE+1))
done

#https://unix.stackexchange.com/questions/600765/how-to-sum-the-number-of-json-elements-in-documents-inside-a-directory-using-jq
#-s for array
PULLS=$(<"$TEMP_FILE")
NUM_PULLS=$(echo "$PULLS" | jq -s 'length')
echo "PULLS $NUM_PULLS"

EARLIEST_PR=$(echo "$PULLS" | jq -s 'sort_by(.created_at) | .[0]')
EARL_NUM=$(echo "$EARLIEST_PR" | jq '.number')
echo "EARLIEST $EARL_NUM"

MERG_FLAG=$(echo "$EARLIEST_PR" | jq '.merged')
if [[ ("$MERG_FLAG" != "null") &&  ("$MERG_FLAG" == "true") ]]; then
    echo "MERGED 1"
else
    echo "MERGED 0"
fi
rm -f "$TEMP_FILE"
