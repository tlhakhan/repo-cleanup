#!/bin/bash

# find all paths that contain "ubuntu"
# get the path property for the object array
# remove double quotes
# match for the name generic-remote and everything not ending with .deb
# remove these set of found files

jfrog rt s ubuntu | jq '.[].path' | sed -e 's/\"//g' | grep "generic-remote" | grep -v \.deb$ | while read line; do jfrog rt del --quiet $line; done
