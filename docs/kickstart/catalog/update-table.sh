#!/bin/bash

ORG_NAME="rh-ai-kickstart" # Replace with your GitHub organization name
LIMIT=1000 # Adjust if you have more than 1000 repos

# Construct the Markdown table header
echo "| Repository Name | Description |"
echo "|-----------------|-------------|"

# Fetch data using gh CLI and format with jq
gh repo list "$ORG_NAME" --json name,description --limit "$LIMIT" | \
jq -r '.[] | "| \(.name) | \(.description // "No description") |"'
