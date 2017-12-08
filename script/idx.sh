#!/bin/bash
# start page of book list
cnt=1
# end page of book list
max=254
# target book catelog file, format: <book_url>\t<book_title>
cat=catelog

# clean old history
rm -rf idx
mkdir idx
cd idx

while [ $cnt -lt $max ]; do
    if ! [ -e allvisit_$cnt.html ]; then
        wget www.wutuxs.com/top/allvisit_$cnt.html
        if [ $? -ne 0 ]; then
            echo "can not get $cnt category"
            exit 1
        fi
    fi
    cat allvisit_$cnt.html | iconv -f GBK -t UTF8 | dos2unix | sed -nr '/class="L"/ p' | sed -r '/target/ d' |sed -r 's@^.*href="(.*)">([^<]+)<.*$@\1\t\2@' >> $cat

    let "cnt=cnt+1"
done

cd -

