#! /bin/bash

RED="\033[31m"
GREN="\033[32m"

END="\033[0m"

main1 (){
while true;
do
clear
echo -e "$RED 1.$GREN UserName:"
echo -e "$RED 2.$GREN Data:"
echo -e "$RED 3.$GREN Time:"
echo -e "$RED 4.$GREN Space"
echo -e "$RED 5.$GREN Next menu"
echo -e "$RED 6.$GREN Exit"
read a 
case $a in
1) 
echo "$USER"
;;
2) 

echo -e `date +"%D"`
;;
3)

echo -e `date +"%T"`
;;
4)

echo -e `df -h $HOME`
;;
5)
main2;;
6) 
exit ;;
esac
sleep 4
done
}
main2(){
while true;
do 
clear
echo -e "$RED 1.$GREN IP" 
echo -e "$RED 2.$GREN Log " 
echo -e "$RED 3.$GREN Login user" 
echo -e "$RED 4. $GREN Uptime" 
echo -e "$RED 5.$GREN Last menu"
echo -e "$RED 6.$GREN Exit"
read b
case $b in 
1)echo -e `grep -i ^I /etc/sysconfig/network-scripts/ifcfg-enp0s3|grep -o [0-9].\.[0-9].\.[0-9].[0-9]*`;;
2) echo `cat /var/log/secure|tail -10`;;
3)echo -e `w`;;
4)echo -e `uptime`;;	
5) main1;;
6)exit;;
esac
sleep 4
done
}
main1
