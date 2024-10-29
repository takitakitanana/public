#!/bin/bash

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing Git..."
    sudo apt update && sudo apt install -y git
fi

# Parse the repository path from the -p argument, or use the first positional argument if no flag is provided
REPO_PATH="."
while getopts ":p:" opt; do
    case $opt in
        p)
            REPO_PATH="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

# Check if a positional argument is provided without the -p flag
if [ -n "$1" ] && [ "$1" != "-p" ]; then
    REPO_PATH="$1"
fi

# Ensure the specified repository path exists
if [ ! -d "$REPO_PATH/.git" ]; then
    echo "Error: No Git repository found at $REPO_PATH"
    exit 1
fi

# Change to the specified repository directory
cd "$REPO_PATH" || exit

# Extract all details from git log and parse email addresses
git log --all --pretty=fuller | grep -E -o "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" | sort -u
