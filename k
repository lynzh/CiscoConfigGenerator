#!/bin/bash
# Script to create simple menus and take action according to that selected
# menu item

_exec_script()
{
libdir=$HOME/scripts/Sorlanet-Tech/2.1gen
if [[ -f $libdir ]] ; then
. $libdir fresh
fi
}

first=109; second=163; third=50; fourth=1
A="1"; B="a"; C="6"; D="0"; E="3"; F="0"; G="1"; H="0"; I="8"; J="2"; K="2"; L="0"; M="2"; N="0"; O="a"; P="2"

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
echo -e "[2] Configure IPv6"
echo -e "[3] set NameServer"
echo -e "[4] Exec configs"
echo -e "======================="
echo -e -n "Enter your menu choice [1-5]: "
}

while :
	do
		clear
		_initial
		read initial
			case $initial in
			1) ;;
			2) ;;
			3) echo -e "Input NS1 :"; read NameServer1; echo -e "Input NS2 :"; read NameServer2 \
			echo -e "\$NameServer1 = $NameServer1 && \$NameServer2 = $NameServer2" ;;
			4) 
			[ -n $NameServer1 ] && export $NameServer1
			[ -n $NameServer2 ] && export NameServer2=${NameServer2} 
			# hopefully have loaded variables
			_exec_script
			;;
		esac
done
