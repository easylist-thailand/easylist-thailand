#!/usr/bin/env sh

eval "$(ssh-agent -s)"
chmod 600 .travis/deploy_key
ssh-add .travis/deploy_key

# Setup Git
git config --global user.email "deploy@travis-ci.org"
git config --global user.name "Deployment Bot (from Travis CI)"
git remote add deploy git@github.com:easylist-thailand/easylist-thailand.git

# Push
git checkout master
git add subscription/easylist-thailand.txt
git commit -m ":bento: [skip ci] Auto-generate subscription from Travis CI (Build $TRAVIS_BUILD_ID)" -m "Travis CI log: $TRAVIS_BUILD_WEB_URL"
git push -u deploy master
