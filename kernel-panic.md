Ahoana ny atao mba hi-redemarena automatique ny pc raha tratran'ny kernel panic na misy défaillance ao amin'ny noyau Linux 

Ny valeur iray alefanao amin'ny default_value an'ny kernel dia migerer ny rédemarrage automatique an'ilay system 
izany hoe raha omenao `panic=n` ny valeur dia mi-redemarrer n(s) apres an'ilay défaillance ny system anao , afaka jerenao ny valeur
an'io n io /defaut `grep GRUB_CMDLINE_LINUX_DEFAULT /etc/default/grub` raha sous-débian sy ny mpandihiny ianao.
Raha famille Gentoo dia afaka ovainao amin'ny /boot/grub/menu.lst ny valeur an'ilay panic

Sokafy amin'ny nano na vim na izay editeur mahazatra anao ireo fichier ireo dia raha famille débian dia 
ovao ity ligne ity ho => `GRUB_CMDLINE_LINUX_DEFAULT="panic=10 quiet`

2 - update-grub2

3 - sokafy ny /boot/grub/grub.cfg dia 

ampio an'ity => `linux   /boot/vmlinuz-2.6.39-2-amd64 root=UUID=ab167e7b-343a-4031-a2b1-673c8ee6dbe5 ro  panic=10 quiet`

Raha sous gentoo ianao dia ity ny ovainao:
`title Gentoo Linux (Kernel x86_64 2.6.29.6-vs2.3.0.36.14)

        root (hd0,0)
        
        kernel /kernel-x86_64-... root=/dev/ram0 real_root=/dev/sda2 panic=10
        
        initrd /initramfs-2.6.29.6-vs2.3.0.36.14
 `       
Raha famille red-hat(fedora, centos, sns) dia ao amin'ny /etc/grub.conf ny configuration ovainao 
`title CentOS (2.6.32-71.el6.x86_64)

        root (hd0,0)
        
        kernel /vmlinuz-2.6.32-71.el6.x86_64 ro root=/dev/... crashkernel=auto rhgb panic=10 quiet
        
        initrd /initramfs-2.6.32-71.el6.x86_64.img`
        
        
 Rédemareo ny system aorian'izay 
 
 ---------
 
## OPTION 2 TSOTSOTRA TESTE

afaka jerenao etat an'ilay fotoana `n` raha tratran'ny panic ilay pc /proc/sys/kernel/panic

`cat /proc/sys/kernel/panic`

Noho izany afaka tonga dia setenao amin'ny `sysctl` ny valeur an'ilay panic `sysctl -w kernel.panic=10` example ny 10 eto afaka ataonao valeur a n io fa seconde nefa
Avereno jerena ilay valeur avy eo tokony mamerina 10 na => (n)  `cat /proc/sys/kernel/panic`

Tsy mila rédemarrage ny systctl 

Andramo amin'izay => ataovy panique manuelle ny kernel ahitanao azy raha mandeha tokoa 
Ahoana ny manao kernel panique manuel? 

Activation touche magique => `echo 1 > /proc/sys/kernel/sysrq` avy eo potserina miaraka ny ` Ctrl + Alt Gr + Imp écr + c `

Raha tsisy an'ireo touche ireo ny PC-nao dia `echo c > /proc/sysrq-trigger` fotsiny dia efa mampi-panic an'ilay kernel

Ity option 2 ity dia option live testing izany hoe tsy miraikitra tsy toy ilay option 1

# Happy hacking
