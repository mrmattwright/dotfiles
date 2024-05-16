#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title copilot-local
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖


urls=(
#locahost
"http://127.0.0.1:8000/actmodels/"
#langsmith
"https://smith.langchain.com/o/3fde053e-4911-4aae-976d-8f144ff3d1f4/projects/p/01f25c3b-8778-40bc-bab5-3056067f9154?columnVisibilityModel=%7B%22outputs%22%3Afalse%2C%22feedback_stats%22%3Afalse%2C%22reference_example%22%3Afalse%7D&timeModel=%7B%22duration%22%3A%227d%22%7D"
#actions
"https://github.com/montoux/model_copilot/actions"


)

# new window
open -na "Google Chrome" --args --new-window "${urls[0]}"

# make sure the new window is open before opening other tabs
sleep 2

# new tab
for url in "${urls[@]:1}"
do
    open -na "Google Chrome" --args "$url"
done
 