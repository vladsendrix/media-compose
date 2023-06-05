#!/bin/bash

# Navigate to the repository directory
cd $DOCKER_CONFIG

# Get the current date and time
currentDateTime=$(date +"%Y-%m-%d %T")

# Add all files to staging area
git add .

# Commit the changes with current date and time as the commit message
git commit -m "$currentDateTime"

# Push the changes
git push
