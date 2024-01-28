#!/bin/bash



repos_dir=$1

if [ -z "$repos_dir" ]; then
    echo "Usage: $0 <repos_dir>"
    exit 1
fi


for repo in $(find $repos_dir -maxdepth 1 -mindepth 1 -type d); do
    echo "Checking $repo"
    cd $repo
        echo ""
    status=$(git status -s)
    code=$?

    if [ $code -ne 0 ]; then
        echo "  Repository $repo has an error:"
        echo "  $status"
        echo ""
        continue
    fi

    if [ -n "$status" ]; then
        echo "  Repository $repo has uncommitted changes:"
        echo "  $status"
    fi
    echo ""
done

