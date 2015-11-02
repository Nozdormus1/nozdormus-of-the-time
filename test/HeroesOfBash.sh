#!/bin/bash
#to run : enter ./HeroesOfBash.sh IPofAnotherPC and do the same thing on this another PC
if ! test -e ~/pack.file
then
	touch ~/pack.file
fi
packfile=~/pack.file
timeofch=$( stat -c %y $packfile )
ipconf=$1
echo "-------------------------------------------------------"
echo "------------------Choose your Hero!--------------------"
echo "---Knight: 100 health, 1-10 attack damage, 5-10 heal---"
echo "----Mage: 50 health, 5-15 attack damage, 3-12 heal----"
echo "*Print \"1\" if you want to be a Mage, print \"2\" if you want to be a Knight"
echo "-------------------------------------------------------"
while true
do
	read hero
	if [ $hero = "1" ]
	then
		damc=1
		ssh $ipconf "echo $hero > $packfile"
		myhealth=50
		echo "You choose Mage!"
		break
	fi
	if [ $hero = "2" ]
	then
		damc=2
		ssh $ipconf "echo $hero > $packfile"
		myhealth=100
		echo "You choose Knight!"
		break
	fi
	if [ $hero != "1" ] && [ $hero != "2" ]
	then
		echo "Please chose a Hero!"
	fi
done
while true
do
	curtime=$( stat -c %y $packfile )
	if [[ $timeofch != $curtime ]]
	then
		echohero=$( cat $packfile )
		if [ $echohero = "1" ]
		then
			echo "Your enemy choose Mage!"	
			enemyhealth=50
		else
			echo "Your enemy choose Knight!"
			enemyhealth=100
		fi
		break
	fi
done
timeofch=$( stat -c %y $packfile)
echo "==============================="
echo "=  your life      enemy life  ="
echo "=      $myhealth            $enemyhealth     ="
echo "==============================="
echo "Write \"a\" for attack, write \"h\" for heal"
while true
do
	while true
	do
		read action	
		if [ $action = "a" ]
		then
			ssh $ipconf "echo 1 > $packfile"
			while true
			do
				curtime=$( stat -c %y $packfile )
				if [[ $timeofch != $curtime ]]
				then
					modifier=$( cat $packfile )
					timeofch=$( stat -c %y $packfile )
					break
				fi
			done
			if [ $damc = "2" ]
			then
				damage=$((( RANDOM % 10 ) + 1 )) 
			else
				damage=$((( RANDOM % 10 ) + 5 ))
			fi
			ssh $ipconf "echo $damage > $packfile"
			echo "You striked for $damage damage!"
			while true
			do
				curtime=$( stat -c %y $packfile )
				if [[ $timeofch != $curtime ]]
				then
					timeofch=$( stat -c %y $packfile )
					if [ $modifier = "1" ]
					then
						enemydam=$( cat $packfile )
						enemyheal=0
						echo "Enemy striked for $enemydam damage!"
					else
						enemydam=0
						enemyheal=$( cat $packfile )
						echo "Enemy healed on $enemyheal points!"
					fi
					enemyhealth=$( expr $enemyhealth - $damage + $enemyheal )
					myhealth=$( expr $myhealth - $enemydam )
					break
				fi
			done
			break
		fi
		if [ $action = "h" ]
		then
			ssh $ipconf "echo 2 > $packfile"
			while true
			do
				curtime=$( stat -c %y $packfile )
				if [[ $timeofch != $curtime ]]
				then
					modifier=$( cat $packfile )
					timeofch=$( stat -c %y $packfile )
					break
				fi
			done
			if [ $damc = "2" ]
			then
				heal=$((( RANDOM % 6 ) + 5 )) 
			else
				heal=$((( RANDOM % 4 ) + 9 ))
			fi
			ssh $ipconf "echo $heal > $packfile"
			echo "You healed on $heal points!"
			while true
			do
				curtime=$( stat -c %y $packfile )
				if [[ $timeofch != $curtime ]]
				then
					timeofch=$( stat -c %y $packfile )
					if [ $modifier = "1" ]
					then
						enemydam=$( cat $packfile )
						enemyheal=0
						echo "Enemy striked for $enemydam damage!"
					else
						enemydam=0
						enemyheal=$( cat $packfile )
						echo "Enemy healed on $enemyheal points!"
					fi
					enemyhealth=$( expr $enemyhealth + $enemyheal )
					myhealth=$( expr $myhealth - $enemydam + $heal )
					break
				fi
			done
			break
		fi
		if [ $action != "a" ] && [ $action != "h" ]
		then
			echo "Write \"a\" for attack, \"h\" for heal!"
		fi
	done
	if [ $damc = "2" ] && (( $myhealth > 100 ))
	then
		myhealth=100
	fi
	if [ $damc = "1" ] && (( $myhealth > 50 ))
	then
		myhealth=50
	fi
	if [ $echohero = "1" ] && (( $enemyhealth > 50 ))
	then
		enemyhealth=50
	fi
	if [ $echohero = "2" ] && (( $enemyhealth > 100 ))
	then
		enemyhealth=100
	fi
	echo "==============================="
	echo "=  your life      enemy life  ="
	echo "=       $myhealth            $enemyhealth      ="
	echo "==============================="
	echo "Write \"a\" for attack, write \"h\" for heal"
	if (( $myhealth <= 0 ))
	then
		echo "You lose!"
		break
	fi
	if (( $enemyhealth <= 0 ))
	then
		echo " You win!"
		break
	fi
done
rm $packfile
	
