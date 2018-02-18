#!/bin/bash

# This is for running on Travis. It automatically tags any merge to Master as a release in the 1.0.x series.
if [[ $TRAVIS_PULL_REQUEST != 'false' || "$TRAVIS_BRANCH" != 'master' ]]; then
  # Don't run on pull requests
  echo 'This only runs on a merge to master.'
  exit 0
fi

# Compute the next tag number
LASTPATCH=$(git describe --tags | cut -d- -f1 | cut -d. -f3)
PATCH=$(($LASTPATCH+1))
echo $PATCH

# Create a tag
curl -H "Authorization: token $GITHUB_KEY" \
     -X POST \
     -d "{\"ref\":\"refs/tags/1.0.$PATCH\", \"sha\":\"$TRAVIS_COMMIT\"}" \
https://api.github.com/repos/keyvanakbary/cqrs-documents/git/refs
