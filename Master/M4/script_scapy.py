from scapy import *
import argparse
import pdb

def init_params():
    msg = "This script is an ARP ping scanner."
    parser = argparse.ArgumentParser(description = msg)
    parser.add_argument('-rh','--rhost', type = str, required = True, help='Ip of the rhost.')
    parser.add_argument('-p','--port', type = str, help='Define specific port. By default is 1234.')
    return parser.parse_args()

if __name__ == "__main__":
    args = init_params()
    rhost = args.rhost
    port = args.port if args.port is not None else "1234"

