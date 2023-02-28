#!bin/bash
# pull current branch commit
git pull 
# get current branch name
branch_name=`git symbolic-ref --short HEAD`
echo "current branch: $branch_name"
git checkout rc/publish
`git checkout $branch_name`
git pull
git merge branch_name
echo "merge success"
git push
echo "publish success"