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
    ls  target -1 | sed -r 's/^([^.]+)\.txt$/\1/' | while read id
    do
        sh nov.sh $id
    done

    exit 0
fi

# book title
title=$1


# target book catelog file, format: <book_url>\t<book_title>
cat=catelog

# book list file, format <url>\t<title>
catelog="./idx/$cat"

function fetch_idx() {
    echo "Generate site catelog"
    #sh idx.sh
    # start page of book list
    cnt=1
    # end page of book list
    max=254

    # clean old history
    rm -rf idx
    mkdir idx
    cd idx

    while [ $cnt -lt $max ]; do

        if ! [ -e allvisit_$cnt.html ]; then
            wget www.wutuxs.com/top/allvisit_$cnt.html
            if [ $? -ne 0 ]; then
                echo "can not get $cnt category"
                return 1
            fi
        fi

        cat allvisit_$cnt.html | iconv -f GBK -t UTF8 | dos2unix | sed -nr '/class="L"/ p' | sed -r '/target/ d' |sed -r 's@^.*href="(.*)">([^<]+)<.*$@\1\t\2@' >> $cat

        let "cnt=cnt+1"
    done

    cd -

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

# more than 1 book hit
if [ $nrbook -gt 1 ]; then
    echo "more than 1 book hit:"
    cat $catelog | grep "$title"
    echo ""
    echo "Please enter full book title"
    exit 5
fi

# book URL end with /
burl=`cat $catelog | grep "$title" | awk '{print $1}'`

# book title(in case user input shorter title)
title=`cat $catelog | grep "$title" | awk '{print $2}'`

# book id
bid=`echo $burl | sed -r 's@^.*/([0-9]+)/$@\1@'`

# book index file name
bkidx="index.html"

# first checkout if novel is downloaded before or not
if ! [ -e ./$bid/$bkidx ]; then
    echo "Book not exist, download full book"

    rm -rf $bid
    mkdir $bid
    cd $bid

    wget -r -np -nd $burl
    if [ $? -ne 0 ]; then
        echo "download full book failed"
        cd -
        exit 9
    fi
else
    echo "Try update books"
    cd $bid

    # update book index
    rm $bkidx
    wget "${burl}${bkidx}"
    if [ $? -ne 0 ]; then
        echo "download book index failed"
        cd -
        exit 9
    fi
fi

# chapter index file, <format: web_page_file_name>\t<chapter_title>
chapters="chapters"

# generate url of book chapters
cat $bkidx | iconv -f GBK -t UTF8 | dos2unix | sed -nr '/class="L".*html/ p' | sed -r 's@^.*/([0-9]+\.html)">([^<]+)<.*$@\1\t\2@' > $chapters

# final target text file
txt=${title}.txt

# clean before generate
rm $txt

# chapter by chapter
cat $chapters | while read line
do
    # file name of this chapter
    fname=`echo $line | sed -r 's@^(.*html).*$@\1@'`
    # chapter title
    tchapter=`echo $line | sed -r 's@^.*l +(.*)$@\1@'`

    echo ""
    echo "file:  $fname"
    echo "title: $tchapter"

    # for debug
    #sleep 2

    # try download if chapter not exist
    if ! [ -e $fname ]; then
        echo "Try download ${burl}${fname}"
        wget ${burl}${fname}
        if [ $? -ne 0 ]; then
            echo "file not exist"
            exit 7
        fi
    fi

    # write chapter title 
    echo $tchapter >> $txt

    # formation of chapter text
    iconv -f GBK -t UTF8 ${fname} | dos2unix | sed -nr '/dd id="contents"/, /class="share"/ p' | sed -r 's@<[^>]+>@@g' | sed -r 's@\&[0-9a-zA-Z]+;@@g' | sed -r '/^[ \t ]*$/ d' | sed -r 's/^(.*)$/    \1/' >> $txt
#    iconv -f GBK -t UTF8 ${fname} | dos2unix | sed -r '/dd id="contents"/, /class="share"/ p' | sed -r 's/<[^>]>//' | sed -r 's/&[0-9a-zA-Z]+;//' | sed -r '/^[ \t]*$/ d' >> $txt

done

cd -
mkdir -p target
cp $bid/$txt target/
echo "Book $title generated to target/$txt"

