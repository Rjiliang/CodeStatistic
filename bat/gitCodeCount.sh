#!/bin/sh
cd $1
if [ $6 == "1" ];then
git pull
fi
git log --pretty=tformat: --since ==$3 --until=$4 --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 + $2 } END { printf "beginTime:'$3' endTime:'$4' projectName: '$2' added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }'>>$5gitTotalCode.txt
