#!/bin/sh
c=4
n=10000
t=localhost

if [ -n "${AB_CONCURRENCY}" ];then
    c=${AB_CONCURRENCY}
fi
if [ -n "${AB_REQUESTS}" ];then
    n=${AB_REQUESTS}
fi
if [ -n "${AB_TARGET}" ];then
    t=${AB_TARGET}
fi

while true;do
    cmd="ab -c $c -n $n http://${t}/"
    echo "Start $cmd"
    $cmd
    echo "Done $cmd"
done
