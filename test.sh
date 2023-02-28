#!bin/bash
branch_name=`git symbolic-ref --short HEAD`
echo "$branch_name"
git checkout main
echo "publish branch"
`git checkout $branch_name`
echo "end"