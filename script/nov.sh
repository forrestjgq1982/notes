#!/bin/bash

# this is used to get nov from http://www.wutuxs.com
# the nov html can be downloaded by
# wget -r -np -nd URL
# <td class="L"><a href="/html/6/6132/4497377.html">1、 一重浪灭一重生</a></td>
# then get filename and title into urls file


path=`pwd`
dir=`basename $path`
txt=$dir.txt
rm $txt

#cat urls | sed -r 's@^.*/([^/].*html).*$@\1@' > flist
#cat urls | sed -r 's@^.*html\t(.*)$@\1@' > chaps

cat urls | while read line
do
    fname=`echo $line | sed -r 's@^.*/([^/].*html).*$@\1@'`
    title=`echo $line | sed -r 's@^\t(.*)$@\1@'`
    echo "proc $fname | $title"
    if ! [ -e dl/$fname  ]; then
        echo "file not exist"
        exit 1
    fi
    cp dl/$fname target

    echo title >> $dir.txt
    
    iconv -f GBK -t UTF8 target | dos2unix | sed -r '/dd id="contents"/, /class="share"/ p' | sed -r 's/<[^>]>//' | sed -r 's/&[0-9a-zA-Z]+;//' | sed -r '/^[ \t]*$/ d' >> $txt

done

rm target

