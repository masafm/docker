#!/bin/sh
c=4
n=10000

if [ -n "${AB_CONCURRENCY}" ];then
    c=${AB_CONCURRENCY}
fi
if [ -n "${AB_REQUESTS}" ];then
    n=${AB_REQUESTS}
fi

while true;do
    cmd="ab -c $c -n $n http://nginx/"
    echo "Start $cmd"
    $cmd
    echo "Done $cmd"
done
