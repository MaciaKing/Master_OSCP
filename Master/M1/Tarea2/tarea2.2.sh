#!/bin/bash
show_menu(){
        echo 
        echo
        echo "nmap for begginers"
        echo "===================="
        echo "1) metasploit"
        echo "2) dirbuster"
        echo "3) nmap"
        echo "4) ofrecer Shell a través de Netcat en un puerto"
        echo "5) conectar con una Shell remota a través de Netcat"
        echo "6) exit"
        echo -n "opcion: "
}

mensajes(){
        if [ $# -ne 1 ]
        then
                echo "[mensajes]Falta argumento"
        fi

        mensaje=$1
        case $mensaje in 
                0)
                        echo
                        echo -n "Introduce direccion IP: "
                        ;;
                1)
                        echo
                        echo -n "Introduce un puerto o rango de puertos: "
                        ;;
                *)
                        ;;
        esac
}

read_ip(){
        read ip
        echo $ip
}

read_puerto(){
        read port
        echo $port
}

elige_opcion(){
        local opcion=$1
        case $opcion in
                1)
                        msfconsole
                        ;;
                2)
                        dirbuster
                        ;;
                3)
                        mensajes 0
                        ip=$(read_ip)
                        nmap -sC -sV $ip
                        ;;
                4)
                        mensajes 1
                        port=$(read_puerto)
                        nc -l -p $port -e /bin/bash
                        ;;
                5)
                        mensajes 0
                        ip=$(read_ip)
                        mensaje 1
                        port=$(read_puerto)
                        nc $ip $port
                        ;;
                6) 
                        exit
                        ;;
        esac
}

sigue=1
while [ $sigue -eq 1 ]
do
        show_menu
        read opcio
        elige_opcion $opcio
done