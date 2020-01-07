# <bitbar.title>Yabai status</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Albert Groothedde</bitbar.author>
# <bitbar.author.github>alber70g</bitbar.author.github>
# <bitbar.desc>Shows the status of Yabai. Current space, floating, sticky, on top and fullscreen.</bitbar.desc>
# <bitbar.dependencies>yabai,jq</bitbar.dependencies>

#!/bin/sh
# query current window
set --local window (yabai -m query --windows --window)
# query current space
set --local space (yabai -m query --spaces --space)

# get data from the responses
set space (echo $space | jq ".index")
set floating (echo $window | jq ".floating")
set sticky (echo $window | jq ".sticky")
set topmost (echo $window | jq ".topmost")
set fullscreen (echo $window | jq ".\"zoom-fullscreen\"")

# the output
echo "[$space] ~$floating s$sticky ^$topmost f$fullscreen"
