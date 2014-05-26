#!/bin/bash
# Script to create simple menus and take action according to that selected
# menu item

_exec_script()
{
libdir=$HOME/scripts/Sorlanet-Tech/2.1gen
if [[ -f $libdir ]] ; then
. $libdir fresh 1>/dev/null
fi
}

_one_one()
{
echo -e "using $first.$second.$third"
}

_initial()
{
echo -e "-------------------------------------"
echo -e " Main Menu "
echo -e "-------------------------------------"
echo -e "[1] Configure IPv4"
echo -e "[-]	first =${first}, second=${second}, third=${third}, fourth=${fourth}"
echo -e "[-] 	MBDamag	= $mbd"
echo -e "[-] 	logging	= $nms"
echo -e "[2] Configure IPv6"
echo -e "[3] Configure NameServers"
echo -e "[-] 	v6 NS1=${NS1_v6}"
echo -e "[-] 	v6 NS2=${NS2_v6}"
echo -e "[-] 	v4 NS1=${NameServer1}"
echo -e "[-] 	v4 NS2=${NameServer2}"
echo -e "[4] Exec configs"
echo -e "======================="
echo -e -n "Enter your menu choice [1-4]: "
}

_exec_script # first inject (current) variables to environment

while :
	do
		clear
		_initial # initial menu
		read initial
			case $initial in
			1) # ipv4
			echo -e "input first digits and press enter * 4 :" ; \
			read first ; read second ; read third ; read fourth ; \
			echo -e "Input full MBD(Minor Brain dmg) :" ; read mbd ; \
			echo -e "Input full NMS :" ; read nms ; \
			
			;;
			2) # ipv6
			;; 
			3) # NS
			echo -e "Input (ipv6) NS1 :"; read NS1_v6 ; \	
			echo -e "Input (ipv6) NS2 :"; read NS2_v6 ; \	
			echo -e "Input (ipv4) NS1 :"; read NameServer1 ; \
			echo -e "Input (ipv4) NS2 :"; read NameServer2 ; \
			;;
			4) 
			[ -n $NameServer1 ] && export NameServer1=${NameServer1}
			[ -n $NameServer2 ] && export NameServer2=${NameServer2}
			[ -n $NS1_v6 ] && export NS1_v6=${NS1_v6}
			[ -n $NS2_v6 ] && export NS2_v6=${NS2_v6}
			# exec with new variables
			_exec_script
			;;
		esac
done
