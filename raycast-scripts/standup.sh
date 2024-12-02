#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title standup
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

urls=(
    # Runtime
    "https://git.montoux.net/groups/engineering/-/boards/189?iteration_id=Current&label_name[]=Squad%3A%3ARuntime"
    # Platform 
    "https://git.montoux.net/groups/engineering/-/boards/187?label_name[]=Squad%3A%3APlatform&iteration_id=Current&group_by=epic"    

    # Lewis
    "https://git.montoux.net/groups/engineering/-/boards/291?assignee_username=lewis.shirer&iteration_id=Current&group_by=epic"
    # Irina        
    "https://git.montoux.net/groups/engineering/-/boards/291?assignee_username=irina&iteration_id=Current&group_by=epic"
    # Simon L 
    "https://git.montoux.net/groups/engineering/-/boards/291?assignee_username=simon.little&iteration_id=Current&group_by=epic"
    # Will
    "https://git.montoux.net/groups/engineering/-/boards/291?assignee_username=william&iteration_id=Current&group_by=epic"    
    # Asher 
    "https://git.montoux.net/groups/engineering/-/boards/291?assignee_username=asher&iteration_id=Current&group_by=epic"
    # Glynn 
    "https://git.montoux.net/groups/engineering/-/boards/291?assignee_username=glynn&iteration_id=Current&group_by=epic"


    # Copilot
    "https://github.com/orgs/montoux/projects/5/views/1"
)

# put the urls in a random order and save them in an array
urls=($(shuf -e "${urls[@]}"))

# new window
open -na "Google Chrome" --args --new-window "${urls[0]}"

# make sure the new window is open before opening other tabs
sleep 2

# new tab
for url in "${urls[@]:1}"
do
    open -na "Google Chrome" --args "$url"
done