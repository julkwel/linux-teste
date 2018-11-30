## Best Practice for linux user

1) Keep System updated

Always keep system updated with latest releases patches, security fixes and kernel when it’s available. Applying security patches is an important part of maintaining Linux server and Linux provides all necessary tools to keep your system updated.

    yum updates
    yum check-update

2) Physical System Security
For best  practices you must protect Linux servers physical console access. Configure the BIOS to disable booting from CD/DVD, External Devices, Floppy Drive in BIOS. Next, enable BIOSpassword & also protect GRUB with password to restrict physical access of your system.

3) Avoid Using FTP, Telnet, And Rlogin / Rsh Services
Use secure medium to transfer files like scp, sftp etc.. and delete other services like ftp, telnet etc..

    yum erase xinetd ypserv tftp-server telnet-server rsh-server

4) Delete unnecessary packages Minimize Software to Minimize Vulnerability
It is important to delete unnecessary package to minimize vulnerability.

    yum list installed

    yum list packageName

    yum remove packageName

5) Disable Unwanted Services from server
Disable all unnecessary services and daemons (services that runs in the background).

    chkconfig –list | grep ’3:on’

To disable service, enter:

    service serviceName stop

    chkconfig serviceName off

6) Check Listening Network Ports
With the help of ‘netstat‘ networking command you can view all open ports and associated programs. As I said above use ‘chkconfig‘ command to disable all unwanted network services from the system.

    netstat -tulpn

OR use the ss command as follows:

    $ ss -tulpn

OR

    nmap -sT -O localhost

    nmap -sT -O server.example.com

7) Turn on SELinux
Security-Enhanced Linux (SELinux) is a compulsory access control security mechanism provided in the kernel. Disabling SELinux means removing security mechanism from the system.

You can view current status of SELinux mode from the command line using ‘system-config-selinux‘, ‘getenforce‘ or ‘sestatus‘ commands.

    sestatus

If it is disabled, enable SELinux using the following command.

    setenforce enforcing

It also can be managed from ‘/etc/selinux/config‘ file, where you can enable or disable it.

8) Turn Off IPv6
If you’re not using a IPv6 protocol, then you should disable it

    vi /etc/sysconfig/network

    NETWORKING_IPV6=no

    IPV6INIT=no

 

 

9) Enable Iptables (Firewall)
For best practices it is recommended to enable and configure server firewall to allow only specific ports that are required and block all the remaining ports.

    service iptables start

10) Keep /boot as read-only
Linux kernel and its related files are in /boot directory which is by default as read-write. Changing it to read-only reduces the risk of unauthorized modification of critical boot files. To do this, open “/etc/fstab” file.

    vi /etc/fstab

Add the following line at the bottom, save and close it.

    LABEL=/boot     /boot     ext2     defaults,ro     1 2

Please note that you need to reset the change to read-write if you need to upgrade the kernel in future.

11) Ignore ICMP or Broadcast Request
Add following line in “/etc/sysctl.conf” file to ignore ping or broadcast request.

Ignore ICMP request:

    net.ipv4.icmp_echo_ignore_all = 1

Ignore Broadcast request:

    net.ipv4.icmp_echo_ignore_broadcasts = 1

Load new settings or changes, by running following command

    sysctl -p

12) Important file Backup
In a production system, it is necessary to take important files backup and keep them in safety vault, remote site or offsite for Disasters recovery.

13) Checking Accounts for Empty Passwords
You must make sure all accounts have strong passwords and no one has any authorized access. Empty password accounts are security risks and that can be easily hackable.

    cat /etc/shadow | awk -F: ‘($2==””){print $1}’

14) Monitor User Activities psacct or acct
If you are dealing with lots of users, then it’s important to collect the information of each user activities and processes consumed by them and analyse them at a later time or in case if any kind of performance, security issues

Monitor User Activity with psacct or acct Commands

15) Disable Ctrl+Alt+Delete in Inittab
In most Linux distributions, pressing ‘CTRL-ALT-DELETE’ will takes your system to reboot process. So, it’s not a good idea to have this option enabled at least on production servers, if someone by mistakenly does this.

    Trap CTRL-ALT-DELETE

    ca::ctrlaltdel:/sbin/shutdown -t3 -r now

 

16) Enforcing Stronger Passwords
A number of users use soft or weak passwords and their password might be hacked with a dictionary based or brute-force attacks. The ‘pam_cracklib‘ module is available in PAM (Pluggable Authentication Modules) module stack which will force user to set strong passwords. Open the following file with an editor.

    vi /etc/pam.d/system-auth

And add line using credit parameters as (lcredit, ucredit, dcredit and/or ocredit respectively lower-case, upper-case, digit and other)

    /lib/security/$ISA/pam_cracklib.so retry=3 minlen=8 lcredit=-1 ucredit=-2 dcredit=-2 ocredit=-1

17) Remove KDE/GNOME Desktops
X Windows on server is not required. There is no reason to run X Windows on your dedicated server. You can remove or disable them to increase security of server and performance.

    yum groupremove “X Window System”

On CentOS 7/RHEL 7 server use the following commands:

    yum group remove “GNOME Desktop”

    yum group remove “KDE Plasma Workspaces”

    yum group remove “Server with GUI”

    yum group remove “MATE Desktop”

18) World-Writable Files
Anyone can modify world-writable file resulting into a security issue. Use the following command to find all world writable and sticky bits set files:

    find /dir -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print

You need to investigate each reported file and either set correct user and group permission or remove it.

19 No-Owner Files
Files not owned by any user or group can pose a security problem. Just find them with the following command which do not belong to a valid user and a valid group

    find /dir -xdev \( -nouser -o -nogroup \) -print

You need to investigate each reported file and either assign it to an appropriate user and group or remove it.

Happy Hacking !!!
