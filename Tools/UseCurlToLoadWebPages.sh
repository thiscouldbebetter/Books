#!/bin/bash

urlBase=https://artflsrv03.uchicago.edu/philologic4/encyclopedie0521/navigate/1/
for i in $(seq 1 5265);
do
	url=$urlBase$i
    echo $url
    curl $url -o $i.md
    sleep 5
done
