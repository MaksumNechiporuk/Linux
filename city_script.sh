#! /bin/bash

RED="\033|31m"
GREN="\033|32m"
END="\033|0m"

City ()
{
Citylst=`awk '{print $6}' phonebook` 
touch sortcity
for i in $Citylst
do
if grep -i "$i" city
then
continue
else
echo  "$i" >> city
fi
done
clear
c=`awk '{print $1}' city`
for i in $c
do
echo "$i - "`awk '{print $6}' phonebook | grep -ci "$i"`| sort -nk2
done
sleep 2
clear
menu
}
Mail(){
maill=`awk '{print $5}' phonebook | grep -oEi "[@][a-z]+"`
for i in $maill
do
if grep -i "$i" mail
then
continue
else
echo  "$i" >> mail
fi
done
clear
m=`awk '{print $1}' mail`

for i in $m
do
echo  "$i - `awk '{print $5}' phonebook | grep -c "$i"` "
done
sleep 2
clear
menu
}
fun ()
{
echo "You want to find"
echo "1)Name"
echo "2)Surname"
echo "4)Mail"
echo "5)  "
read a
if grep -niE "$a"  phonebook  
then
clear
grep -niE "$a" phonebook
else
echo "Error"
fi
sleep 2
clear
menu
}
People()
{
 
echo "-18 - ` awk '{print $3}' phonebook | grep -ioc '[0-9]*1[0-7]'` "
echo "18-29 - `awk '{print $3}' phonebook | grep -ioc -e '1[8-9]' -e '2[0-9]'`"
echo "30+ - `awk '{print $3}'  phonebook | grep -ioc '[3-9][0-9]'`"
sleep 2
clear
menu
}
menu()
{
echo "1) Show city"
echo "2) Show mail"
echo "3) Show age"
echo "4) Search" 
echo "5) Exit"
read c
case $c in
1) City;;
2) Mail;;
3) People;;
4) fun;;
5) exit;;
esac
} 
menu
