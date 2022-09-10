# copy all and log to file
cp -av jobs/* /mnt/xd &> copy-log.txt

# kill all by name
pkill -f "<pattern>"
