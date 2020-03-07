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
	:bento: [skip ci] Auto-generate subscription from Travis CI (Build $TRAVIS_BUILD_ID)


	Co-Authored-By: $AUTHOR_NAME <$AUTHOR_EMAIL>
END
)
git checkout master
git add subscription/easylist-thailand.txt
git add subscription/ublock.txt
git commit -m "$COMMIT_MSG"
git push -u deploy master
