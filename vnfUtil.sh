#!/bin/bash     
#echo CPU: `top -b  -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'` 
FREE_DATA=`free -m | grep Mem` 
CURRENT=`echo $FREE_DATA | cut -f3 -d' '`
TOTAL=`echo $FREE_DATA | cut -f2 -d' '`
#echo RAM: $(echo "scale = 2; $CURRENT/$TOTAL*100" | bc)
#echo HDD: `df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1`

cpu=`top  -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'` 
ram=$(echo "scale = 2; $CURRENT/$TOTAL*100" | bc)
hdd=`df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1`
sbHostname=`hostname`
privateIP=`hostname -I | awk '{print $1}'`

cpu=`top -bn 1 | awk 'NR>7{s+=$9} END {print s}'`

#printf "%s%s" $cpu "%"
#echo $cpupc



#echo HOST:$sbHostname, IP:$privateIP, CPU:$cpu, RAM:$ram, HDD:$hdd
printf "HOST:%s CPU:%s%s RAM:%s" $privateIP $cpu "%" $ram
