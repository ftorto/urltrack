#!/bin/bash
ROOTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $ROOTPATH

if test ! -f trackList.txt
then
  touch trackList.txt
fi

for url in $(cat trackList.txt)
do
   echo "Checking $url"
   hresult=$(curl -s ${url} | sha256sum | sed 's/ .*//')
   hurl=$(echo "$url" | sha256sum | sed 's/ .*//')
   mkdir -p results/$hurl
   cd results/$hurl >/dev/null
   echo "$url" > url.txt
   filedate=$(date +"%Y%m%d_%H%M%S")
   curl -s ${url} > ${filedate}_${hresult}.html
done
