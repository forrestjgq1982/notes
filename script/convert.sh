#!/bin/bash


if [ $# -ne 1 ]; then
echo "file need provided"
exit 1
fi

txt=$1
cp $txt $txt.bk

file $txt | grep 'UTF-8' > /dev/nul
if [ $? -ne 0 ]; then
    iconv -f GBK -t UTF-8 $txt > tmp1.txt
    rm -rf $txt
    mv tmp1.txt $txt
fi

cat $txt | dos2unix | sed -r '/^ *$/ d' > tmp.txt

cat tmp.txt | sed -r '/^ *$/ d' | sed -r 's/http.*html//' | sed -r 's/www.*cc//' | sed -r 's/www.*com//' | sed -r 's/\[.*棉花糖.*\]//' | sed -r 's/[a-zA-Z]+.cc//' > t1.txt
cat t1.txt | sed -r 's/&#[0-9]+;//g' | sed -r 's/&#[0-9]+//g' | sed -r 's/\[.*小说.*\]//g' | sed -r 's/\[.*txt.*\]//' | sed -r 's/<.*>.*<\/.*>//g' | sed -r 's/<.*>//g' > t2.txt
cat t2.txt | sed -r 's/WWW.*CC//g' | sed -r 's/好看的小说棉花糖//' | sed -r 's/棉花糖小说//g' |sed -r 's/txt小说下载80txt.com//' | sed -r 's/求书小说网//g' | sed -r 's/好看的小说//g' >t1.txt
cat t1.txt | sed -r 's/想看的书.*没有广告//' | sed -r 's/求书网小说//' | sed -r 's/[0-9a-zA-Z. ]+无弹窗广告//' | sed -r 's/txt.*com//'> t2.txt
cat t2.txt | sed -r 's/txt.*下载//' | sed -r 's/无弹窗.*好评//' | sed -r 's/\[.*\]//'> t1.txt
cat t1.txt | sed -r 's/更新快.*广告少//' | sed -r 's/看本书最新章节请到//' | sed -r 's/章节目录 //'> t2.txt

mv t2.txt $txt
rm -rf t1.txt t2.txt t3.txt t4.txt tmp.txt

echo "final file: $txt"


