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
c=0
m=`cat city`
mkdir Download
rm -f png
touch png
rm -f site_png
touch site_png
for i in $m
do
echo $i
curl $i > site_png
grep -o "https://postcode.in.ua/images/image_c.php?id=[0-9]*[0-9]" site_png >> png
done
m=`cat png`
c=0
for i in $m
do
#!wget $i
let c+=1
 wget -P /root/Linux/Download/ $i 
mv /root/Linux/Download/image*  /root/Linux/Dorwnload/img$c.png
done
git add -A
git commit -m "Add scripts_image"
git push

