#!/bin/bash
URL="http://localhost:2456/sendMessage"
TOKEN="5056042442:AAEJ93iTvu98QE7jSu5darlNN30492W2ceI"
CHAT_ID="1508734793"
TEXT="Hello World"

res=$(curl -s -X POST $URL -d token=${TOKEN} -d chat_id=$CHAT_ID -d text=$TEXT)

echo $res
