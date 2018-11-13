#! /bin/bash

url="https://postcode.in.ua/ua/codes/city/1007/a"
curl $url > site.html

n=`grep -o "https://postcode.in.ua/ua/codes/city/1007/street/[0-9]*" site.html`
rm -f city
touch city
for i in $n
do
echo "$i" >>city
done

m=`$city`
for i in $m
do
curl $i > site_png
m=`grep -o "https://postcode.in.ua/images/image_c.php?id=[0-9]*" site_png`
wget -P /Download/$m

done
