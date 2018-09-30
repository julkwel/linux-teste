#!/bin/bash
#check your ram memory
free_ram=$(free -mt | grep Total | awk '{print $4}')

## check rehefa kelikely le ram in MB 
if [[ "$free_ram" -le 10000  ]]
         then
        ## get top processes consuming system memory and save to temporary file 
         ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem  >>/tmp/top_tendakanina.log
         file=/tmp/top_tendakanina.log
        ## xmessage system
         zenity --info --text="Your computer RAM is low !\n\nFree memory: $free_ram MB ,check $file do show who eat your RAM ,\n Do you wish to continue"
fi

exit 0
