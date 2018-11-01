#! /bin/bash

RED="\033|31m"
GREN="\033|32m"
END="\033|0m"

city (){
Citylst=`awk '{print $6}' phonebook`
for i in $Citylst
do
if grep  "$i" city
then
continue
else 
echo "$i" >> city
fi 
done
c=`awk '{print $1}' city`
for i in $c
do 
echo "$i -  `awk '{print $6}' phonebook | grep -c "$i"`"
done
}

mail(){
maill=`awk '{print $5}' phonebook | grep -oEi "[@][a-z]+[/.][a-z]+"`

for i in $maill
do 
if grep "$i" mail
then 
continue
else
echo "$i" >> mail
fi 
done
 m=`awk '{print $1}' mail`
for i in $m
do
 
echo "$i - `awk '{print $5}' phonebook | grep -c "$i"` " 
done 
 
}
city
mail



