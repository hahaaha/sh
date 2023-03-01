#!bin/bash
# 定义颜色变量
RED="\E[1;31m" # 红
GREEN='\E[1;32m' # 绿
YELLOW='\E[1;33m' # 黄
BLUE='\E[1;34m' # 蓝
PINK='\E[1;35m' # 粉红
RES='\E[0m' # 清除颜色
# set publish branch
publish_branch="rc/publish"
# get current branch name
branch_name=`git symbolic-ref --short HEAD`
printf "${GREEN}current branch: $branch_name${RES}\r\n"
printf "${GREEN}publish branch: $publish_branch${RES}\r\n"
if test $branch_name != $publish_branch
then 
    # pull current branch commit
    git pull 
    git checkout rc/publish
    git pull
    # merge crrent branch to publish branch
    git merge $branch_name
    printf "${GREEN}merge success${RES}\r\n"
    # push op
    git push
    printf "${GREEN} publish success${RES}\r\n"
    git checkout $branch_name
    echo "done"
else 
    printf "${RED}you are in publish branch${RES}\r\n"
fi
