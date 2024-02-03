from scapy.all import IP, TCP, sr
import argparse

def init_params():
    msg = "This script is an ARP ping scanner."
    parser = argparse.ArgumentParser(description = msg)
    parser.add_argument('-rh','--rhost', type = str, required = True, help='Ip of the rhost.')
    parser.add_argument('-p','--port', type = str, help='Define specific port. By default is 1234.')
    return parser.parse_args()

def arp_ping_scan(port, host):
    ip = IP(dst=host)
    tcp = TCP(sport=5000, dport=port, flags='S')
    packet = ip / tcp
    r = sr(packet, timeout=1)

    if r[0][0][1].haslayer(TCP):
        if r[0][0][1]['TCP'].flags == 'SA':
            # Generar paquete ACK
            seq = r[0][0][1]['TCP'].ack
            tcp = TCP(sport=5000, dport=port, seq=seq, flags='A')
            packet2 = ip / tcp
            r2 = sr(packet2, timeout=1)
            # Generar paquete RST
            seq = r2[0][0][1]['TCP'].ack
            tcp = TCP(sport=5000, dport=port, seq=seq, flags='R')
            packet3 = ip / tcp
            r3 = sr(packet3, timeout=1)
            print("El puerto esta abierto y activo")
        else:
           print("Port is clossed") 
    else: 
        print("No se ha detectado ningun host activo")

if __name__ == "__main__":
    args = init_params()
    rhost = args.rhost
    port = args.port if args.port is not None else '1234'
    arp_ping_scan(int(port), rhost)