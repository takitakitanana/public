#!/bin/bash

# Ensure required tools are installed
install_required_tools() {
    local required_tools=("git" "curl" "jq")

    for tool in "${required_tools[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            sudo apt update && sudo apt install -y "$tool"
        fi
    done
}

if [ -z "$1" ]; then
    echo "usage $0 <username>"
    exit 1
fi

USERNAME=$1
GITHUB_API_URL="https://api.github.com"

install_required_tools

fetch_repos() {
    curl -s "${GITHUB_API_URL}/users/${USERNAME}/repos?per_page=100" | jq -r '.[].full_name'
}

check_commits() {
    REPO=$1
    curl -s "${GITHUB_API_URL}/repos/${REPO}/commits?author=${USERNAME}" | jq -r "if length > 0 then \"https://github.com/${REPO}\" else empty end"
}

fetch_public_prs() {
    curl -s "${GITHUB_API_URL}/search/issues?q=type:pr+author:${USERNAME}" | jq -r '.items[].repository_url' | sed 's#https://api.github.com/repos/#https://github.com/#'
}

for repo in $(fetch_repos); do
    check_commits "$repo"
done | sort -u

fetch_public_prs | sort -u
