#!/bin/bash

# this is used to get nov from http://www.wutuxs.com
# input is the book title string
# 
# this script will check first the categories of books
# in web size www.wutuxs.com, and generate index if 
# not.
# 
# If book found in category, script will try download 
# all book at once if book has not been downloaded, 
# otherwise the book will be updated

# no arg to update all exist
# idx to update index
# otherwise specify the name of book
if [ $# -eq 0 ]; then
    list=`ls -1 target/ | sed -r 's/(.*)\.txt/\1/'`

    for n in $list
    do
        $0 $n
    done
    exit 0
fi

if [ $# -lt 1 ]; then
    for param in $@
    do
        $0 $param
    done

    exit 0
fi

wgeto="-q"
# book title
title=$1


# target book catelog file, format: <book_url>\t<book_title>
cat=catelog

# book list file, format <url>\t<title>
catelog=`realpath ./$cat`

function fetch_idx() {
    echo "Generate site catelog"

    rm -f $catelog tmpcat
    #sh idx.sh
    # start page of book list
    cnt=1
    # end page of book list
    max=254

    # clean old history

    url="www.wutuxs.com/top"

    while [ $cnt -lt $max ]; do
        web=allvisit_$cnt.html

        rm -f $web

        echo "fetch index $cnt/$max"
        if ! [ -e $web ]; then
            wget $url/$web $wgeto
            if [ $? -ne 0 ]; then
                echo "can not get $cnt category"
                rm -f $web
                return 1
            fi
        fi

        if [ $cnt -eq 1 ]; then
            max=`cat $web | iconv -f GBK -t UTF8 | dos2unix | sed -nr '/class="last"/ p' | sed -r 's/^.*class="last".([0-9]+)<.*$/\1/'`
        fi

        cat $web | iconv -f GBK -t UTF8 | dos2unix | sed -nr '/class="L"/ p' | sed -r '/target/ d' |sed -r 's@^.*href="(.*)">([^<]+)<.*$@\1\t\2@' >> tmpcat

        rm -f $web

        let "cnt=cnt+1"
    done
    
    mv tmpcat $catelog

    return 0
}

#if [ $# -ne 1 ]; then
#    echo "usage: $0 <nov_title>"
#    exit 2
#fi


# check if book list need be updated
if ! [ -e $catelog ] || [ "x$title" == "xidx" ]; then
    fetch_idx
    if [ $? -ne 0 ]; then
        echo "fetch index failed"
        exit 1
    fi
fi

# get category and book id
nrbook=`cat $catelog | grep "$title" | wc -l`
if [ $nrbook -eq 0 ]; then
    echo "book $title not found"
    exit 4
fi

echo "$nrbook book(s) found:"
cat $catelog | grep "$title" | sed -r 's/^.*\t(.+)$/\1/' | cat -n
echo ""

if [ $nrbook -gt 1 ]; then
    echo "Please choose a book, 0 for exit, 1~$nrbook for selected book index"
    read nr


    if [ "x$nr" == "x" ] || [ $nr -eq 0 ]; then
        exit 0
    fi

    if [ $nr -gt $nrbook ]; then
        echo "invalid book index $nr"
        exit 1
    fi
else
    nr=1
fi

bookinfo=`cat $catelog | grep "$title" | sed -nr "$nr p"`

# book URL end with /
burl=`echo $bookinfo | awk '{print $1}'`

# book title(in case user input shorter title)
title=`echo $bookinfo | awk '{print $2}'`

# book id
bid=`echo $burl | sed -r 's@^.*/([0-9]+)/$@\1@'`

# book index file name
bkidx="index.html"

# last writtern chapter index, 0 for never writtern,
# otherwise the chapter from 1
chidx=0

# file to store $chidx
chidxfile="chidx"

# chapter index file, <format: web_page_file_name>\t<chapter_title>
chapters="chapters"


# first checkout if novel is downloaded before or not
if ! [ -e ./$bid/$chapters ]; then
    echo "Book not exist, download full book"

    rm -rf $bid
    mkdir $bid
    cd $bid

    wget -r -np -nd $burl $wgeto
    if [ $? -ne 0 ]; then
        echo "download full book failed"
        cd -
        rm -rf $bid
        exit 9
    fi
    rm -f robots.txt

else
    echo "Try update books"
    cd $bid

    # update book index
    rm -f $bkidx
    wget "${burl}${bkidx}" $wgeto
    if [ $? -ne 0 ]; then
        echo "download book index failed"
        cd -
        exit 9
    fi
fi

if ! [ -e $chidxfile ]; then
    echo "0" > $chidxfile
    chidx=0
else
    chidx=`head -1 $chidxfile`
fi


# generate url of book chapters
cat $bkidx | iconv -f GBK -t UTF8 | dos2unix | sed -nr '/class="L".*html/ p' | sed -r 's@^.*/([0-9]+\.html)">([^<]+)<.*$@\1\t\2@' | sed -r 's@[*?]+@~@'> $chapters

rm -f $bkidx

# final target text file
txt=${title}.txt

# clean before generate
# rm $txt

if [ $chidx -eq 0 ]; then
    rm -f $txt
fi

total=`cat $chapters | wc -l`
if [ $chidx -ge $total ]; then
    echo "book has no update"
    exit 0
fi
let "chidx=chidx+1"

# chapter by chapter

cat $chapters | sed -nr "$chidx,$ p" > chtmp

# we use read < chtmp here to avoid var passing fail due to pipe
while read line
do
    # file name of this chapter
    fname=`echo $line | sed -r 's@^(.*html).*$@\1@'`
    # chapter title
    tchapter=`echo $line | sed -r 's@^.*html[ \t]+(.*)$@\1@' | sed -r 's@[*?]+@~@'`

    echo ""
    echo "file:  $fname"
    echo "title: $tchapter"


    # try download if chapter not exist
    if ! [ -e $fname ]; then
        # for debug

        #sleep 1
        echo "Try download $chidx/$total: ${burl}${fname}"
        wget ${burl}${fname}  $wgeto
        if [ $? -ne 0 ]; then
            echo "download fail"
            break
        fi
    fi

    # write chapter title 
    echo $tchapter >> $txt

    # formation of chapter text
    iconv -f GBK -t UTF8 ${fname} | dos2unix | sed -nr '/dd id="contents"/, /class="share"/ p' | sed -r 's@<[^>]+>@@g' | sed -r 's@\&[0-9a-zA-Z]+;@@g' | sed -r '/^[ \t ]*$/ d' | sed -r 's/^(.*)$/    \1/' >> $txt
#    iconv -f GBK -t UTF8 ${fname} | dos2unix | sed -r '/dd id="contents"/, /class="share"/ p' | sed -r 's/<[^>]>//' | sed -r 's/&[0-9a-zA-Z]+;//' | sed -r '/^[ \t]*$/ d' >> $txt

    rm -f ${fname}
    let "chidx=chidx+1"
done < chtmp

rm -f chtmp

let "chidx=chidx-1"
echo "$chidx" > $chidxfile

if [ $chidx -lt $total ]; then
    echo "only $chidx/$total chapters downloaded, please try again"
fi

cd -
mkdir -p target
cp $bid/$txt target/
echo "Book $title generated to target/$txt"

