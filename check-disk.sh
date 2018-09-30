
#!/bin/bash
#check your ram memory
free_disk=$(df /dev/sda | grep -Eo '[0-9]{4}' | awk '{printf $1}')

## check rehefa kelikely le ram
if [[ "$free_disk" -le 100000000  ]]
         then
        ## xmessage system
        zenity --info --text="Your disk is kely sisa it $free_disk sisa tavela"
fi
exit 0
