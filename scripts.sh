#! /bin/bash

a="https://app.bitpool.com/#/login?pane=organisation"
curl $a > site.html

n=`grep -Ei "bpoapp" site.html | grep -oEi "[0-9]*"`

echo -e "$n"
h=`date +"%H"`
m=`date +"%M"`
echo "`date +"%H:%M"`"
d=$(($h+$m))
if (( $d>$n ))
then
echo "d>n=$d>$n"

elif (( $d<$n ))
then
echo "d<n=$d<$n"

elif (( $d=$n ))
then
echo "d=n=$d"=$n
fi
