#!/usr/bin/env sh

eval "$(ssh-agent -s)"
chmod 600 .travis/deploy_key
ssh-add .travis/deploy_key
git remote add deploy git@github.com:easylist-thailand/easylist-thailand.git
git add subscription/easylist-thailand.txt
git commit -m ":bento: Auto-generate subscription from Travis CI (Build $TRAVIS_BUILD_ID)" -m "Travis CI log: $TRAVIS_BUILD_WEB_URL"
git push deploy master
