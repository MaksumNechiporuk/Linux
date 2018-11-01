#! /bin/bash

menuUsers()
{
clear
echo "1.Create"
echo "2.Mod"
echo "3.Delete"
echo "4.Back"
read a
case $a in
1)
Create_user
;;
2) UserMod 
;;
3)
while ( true )
do
echo "Enter users name"
read d

if userdel -r $d
then
break
fi
done
mainMenu
;;
4)
mainMenu

esac

}

UserMod()
{
clear
echo "1.Name"
echo "2.UID"
echo "3.GID"
echo "4.Expire"
echo "5.Coment"
echo "6.Back"
read t
echo "Enter name"
read n
case $t in
1)
if grep "^$n:" /etc/passwd;
then
echo "Enter new name"
read nn
usermod -l $nn $n
else 
echo "Error"
fi
UserMod
;;
2)
while ( true )
do
echo "Enter new UID"
read u
if usermod -u $u $n
then
break
fi
done
;;
3)
echo "Enter new GID"
read g
groupmod -g $g $n
;;
4)
while( true )
do
echo "Enter year"
read y
echo "Enter mouth"
read m
echo "Enter day"
read d
s=$y-$m-$d
if usermod -e $s $n
then
break
else
echo "Error"
fi
done;;
5) echo "Enter coment"
read coment
usermod -c $coment $n
;;
6) menuUsers
esac

}
UserComent()
{
clear
echo "Enter coment"
read coment
usermod -c $coment $name
}
createGroups()
{
clear
echo "1.Default"
echo "2.Custom"
echo "3.Back"
read o
while ( true )
do
echo "Enter name group"
read group
case $o in
1)

if  groupadd $group
then
break
fi
;;
2)
echo "Enter GID"
read gid
if groupadd -g $gid $group
then
break
fi
;;
3)
mainMenu
;;
esac
done
menuGroups
}
menuGroups()
{
clear
echo "1.Create"
echo "2.Mod"
echo "3.Delete"
echo "4.Back"
read f
case $f in
1)
createGroups
;;
2)
echo "1.Name"
echo "2.GID"
read c

while ( true )
do
echo "Enter name"
read nm
case $c in
1)
echo "Enter new name"
read new
if groupmod -n $new $nm
then
break
fi
;;
2)
echo "Enter new GID"
read gd
if groupmod -g $gd $nm
then
break
fi
;;
esac
done
mainMenu
;;
3)
while (true )
do
echo "Enter names group"
read gr
if groupdel  $gr 
then
break
fi
done
;;
4) mainMenu
esac




}
show(){
clear
echo "1.Show Users"
echo "2.Show Groups"
echo "3.Back"
read t
case $t in
1)
cut -d: -f1  /etc/passwd
;;
2)
cut -d: -f1 /etc/group
;;
3)
mainMenu;;
esac
mainMenu
}


mainMenu(){

echo "1.Users"
echo "2.Groups"
echo "3.Show"
echo "4.Exit"
read c
case $c in
1)
menuUsers;;
2)
menuGroups;;
3)show

;;
4)
exit;;
esac
}
UserExpire()
{
clear
while( true )
do
echo "Enter year"
read y
echo "Enter mouth"
read m
echo "Enter day"
read d
s=$y-$m-$d
if usermod -e $s $name
then
break
else
echo "Error"
fi
done
}
UserGID()
{
clear
while ( true )
do
echo "Enter GID"
read g
if groupmod -g $g $name
then
break
else
groupmod -g $g $name

break
fi
done
}

Create_user(){
clear
echo "1.Custom"
echo "2.Defaults"
read a
case $a in
1)
while ( true ) ;
do
echo "Enter name"
read name
if grep "^$name:" /etc/passwd
then 
echo "Error"
else
break
fi
done

while ( true )
do
echo "Enter UID"
read uid
if useradd -u $uid $name
then
break
else
echo "Erorr"
fi
done
UserGID
UserExpire 
UserComent
menuUsers
;;
2)
while ( true );
do
echo "Enter name"
read b
if  grep "^$b:" /etc/passwd 
then
echo "Error"
else
useradd $b
break
fi
done
;;
esac
menuUsers
}
clear
mainMenu
