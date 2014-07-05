ls *.zip | xargs -P 8 -n 1 bash -c 'echo "processing $0;" ; unzip -p $0 | pv | gzip -9 > $(basename $0 .zip).gz'
