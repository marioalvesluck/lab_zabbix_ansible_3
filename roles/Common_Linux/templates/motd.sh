#!/bin/sh
#
clear
[ -r /etc/lsb-release ] && . /etc/lsb-release

if [ -z "$DISTRIB_DESCRIPTION" ] && [ -x /usr/bin/lsb_release ]; then
        # Fall back to using the very slow lsb_release utility
        DISTRIB_DESCRIPTION=$(lsb_release -s -d)
fi

HOSTNAME_UPPER=$(echo $HOSTNAME | tr a-z A-Z)

echo "Servidor   : $HOSTNAME_UPPER"
printf "Contato    : mario@empresa.com.br"
printf "\n"
printf "Website    : https://www.empresa.com.br"
printf "\n"
printf "\n"
echo "Welcome to" $(echo $DISTRIB_DESCRIPTION | sed 's/\"//g') "kernel" $(uname -r)
printf "\n"

# Logged Users
LoggedInUsers=$(who | wc -l)

#System date
date=`date`

#System load
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`

#System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))

#Root fs info
root_free=`df -h / | awk '/\// {print $4}'|grep -v "^$"`
boot_free=`df -h /boot | awk '/\// {print $4}'|grep -v "^$"`

#Memory Usage
memory_usage=`free -m | grep Mem | awk '{print $3/$2 * 100.0}' | xargs printf "%.*f\n" 2 | sed 's/$/%/'`

#Users
users=`users | wc -w`
USER=`whoami`

#Processes
processes=`ps aux | wc -l`

#Interfaces
INTERFACE=$(ip -4 ad | grep 'state UP' | awk -F ":" '!/^[0-9]*: ?lo/ {print $2}')

echo "System information as of: $date"
echo
printf "System Load:\t%s %s %s\tSystem Uptime:\t\t%s "days" %s "hours" %s "min" %s "sec"\n" $LOAD1, $LOAD5, $LOAD15 $upDays $upHours $upMins $upSecs
printf "Memory Usage:\t%s\t\t\tSwap Usage:\t\t%s\n" $memory_usage $swap_usage
printf "Free On /:\t%s\t\t\tFree on /boot:\t\t%s\n" $root_free $boot_free
printf "LoggedIn Users:\t%s\t\t\tWhoami:\t\t\t%s\n" $LoggedInUsers $USER
printf "Processes:\t%s\t\t\t\n" $processes
printf "\n"
printf "Interface\tMAC Address\t\tIP Address\t\n"

for x in $INTERFACE
  do
        MAC=$(ip ad show dev $x |grep link/ether |awk '{print $2}')
        IP=$(ip ad show dev $x |grep -v inet6 | grep inet|awk '{print $2}')
        printf  $x"\t\t"$MAC"\t"$IP"\t\n"

  done
echo
echo
