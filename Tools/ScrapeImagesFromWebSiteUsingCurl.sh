#!/bin/bash

pageUrlBase=https://www.gocomics.com/peanuts
echo pageUrlBase is: $pageUrlBase
for y in $(seq 1951 2000);
do
	for m in $(seq 1 12);
	do
		for d in $(seq 1 31);
		do
			yearMonthDay=$y/$m/$d
			pageUrl=$pageUrlBase/$yearMonthDay
			echo $pageUrl

			imageUrl=$(curl $pageUrl | grep "og:image" | head -1)
			echo $imageUrl

			imageUrl=${imageUrl:35}
			echo $imageUrl

			imageUrl=${imageUrl:0:63}
			echo $imageUrl

			imageFileName=${yearMonthDay//\//_}

			curl $imageUrl -o $imageFileName.gif

			sleep 5
		done
	done
done
