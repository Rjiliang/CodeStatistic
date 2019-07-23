#!/bin/sh
echo $1
echo $2
echo $3
echo $4
cd $1
if [ $6 == "1" ];then
svn up
fi
start_revision=`svn log -r{$3}:{$4} | sed -n '2p'|cut -d '|' -f 1 |cut -c 2-`
echo $start_revision
end_revision=`svn log -r{$3}:{$4} | sed '/^---/d' |awk '{print $1}'|sed '/^$/d'|tail -1|cut -d '|' -f 1 |cut -c 2-`
echo $end_revision
cd $1
svn diff -r $[$start_revision]:$[$end_revision] >tmp.txt
add_lines_count=`grep "^+" tmp.txt|grep -v "^+++"|sed 's/^.//'|sed '/^$/d'|wc -l`
echo $add_lines_count
del_lines_count=`grep "^-" tmp.txt|grep -v "^---"|sed 's/^.//'|sed '/^$/d'|wc -l`
echo $del_lines_count
total=$[$[$add_lines_count]+$[$del_lines_count]]
echo $total
echo 'beginTime:'$3' endTime:'$4' projectName: '$2' added lines: '$add_lines_count' removed lines : '$del_lines_count' total lines: '$total'' >>$5gitTotalCode.txt