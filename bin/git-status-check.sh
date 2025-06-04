#!/bin/bash



repos_dir=$1

if [ -z "$repos_dir" ]; then
    echo "Usage: $0 <repos_dir>"
    exit 1
fi


for repo in $(find $repos_dir -maxdepth 1 -mindepth 1 -type d); do
    # Colors
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    BLUE='\033[0;34m'
    NC='\033[0m' # No Color

    echo -e "${BLUE}Checking $repo${NC}"
    cd $repo
    echo ""
    status=$(git status -s)
    code=$?

    if [ $code -ne 0 ]; then
        echo -e "  ${RED}Repository $repo has an error:${NC}"
        echo -e "  ${YELLOW}$status${NC}"
        echo ""
        continue
    fi

    if [ -n "$status" ]; then
        echo -e "  ${YELLOW}Repository $repo has uncommitted changes:${NC}"
        echo -e "  ${RED}$status${NC}"
    else
        echo -e "  ${GREEN}Repository $repo is clean.${NC}"
    fi
    echo ""
done

