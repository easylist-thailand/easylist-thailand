#!/usr/bin/env sh

eval "$(ssh-agent -s)"
chmod 600 .travis/deploy_key
ssh-add .travis/deploy_key

AUTHOR_EMAIL="$(git log -1 $TRAVIS_COMMIT --pretty="%cE")"
AUTHOR_NAME="$(git log -1 $TRAVIS_COMMIT --pretty="%aN")"

# Setup Git
git config --global user.email "deploy@travis-ci.org"
git config --global user.name "Deployment Bot (from Travis CI)"
git remote add deploy git@github.com:easylist-thailand/easylist-thailand.git

# Push
COMMIT_MSG=$(cat <<- END
	Co-authored-by: $AUTHOR_NAME <$AUTHOR_EMAIL>

	Travis CI log: $TRAVIS_BUILD_WEB_URL
END
)
git checkout master
git add subscription/easylist-thailand.txt
git commit -m ":bento: [skip ci] Auto-generate subscription from Travis CI (Build $TRAVIS_BUILD_ID)" -m $COMMIT_MSG
git push -u deploy master
