#!bin/bash
# pull current branch commit
git pull 
# get current branch name
branch_name=`git symbolic-ref --short HEAD`
echo "current branch: $branch_name"
git checkout rc/publish
git pull
# merge crrent branch to publish branch
`git merge $branch_name`
echo "merge success"
# push op
git push
echo "publish success"
`git checkout $branch_name`
echo "done"
