#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title copilot-demo
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖


urls=(
#start
"https://demo.modelcopilot.ai/actmodels/"
#diagram
"https://excalidraw.com/"
#roadmap
"https://docs.google.com/presentation/d/1IW5VcMivo7HpaXZ9sAR10G31thGpHramvzPwmauNmXI/edit#slide=id.g24908f3e68e_0_18"
#admin
"https://model-copilot-demo.fly.dev/admin/actmodels/actuarialmodel/"
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