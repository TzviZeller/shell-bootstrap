#TODO:Add header
#!/usr/bin/env python3

import argparse
import platform
import logging
import subprocess
import sys
import os

parser = argparse.ArgumentParser()
parser.add_argument('-L','--loglevel', default='INFO',
    help='Level for logging, Only Accepted Values [DEBUG, INFO, WARNING, ERROR, CRITICAL]')
args = parser.parse_args()

def setup(log_level):
    """_summary_  #TODO:fillout

    Args:
        log_level (_type_): _description_

    Returns:
        _type_: _description_
    """
    # Setup Logging
    if log_level not in ('DEBUG', 'INFO', 'WARNING', 'ERROR','CRITICAL'):
        log_level = 'INFO'
    #TODO:Make log_level dynamic, wont take string val
    logformat='%(asctime)s - %(levelname)s - %(message)s'
    logging.basicConfig(filename='example.log', filemode='w', format=logformat, level=logging.INFO)
    logging.info('####Boostrap Start####')

    # Determine OS
    OS = platform.system()
    logging.info(platform.uname())
    if OS == 'Linux':
        print(f"Detected System = {OS}")
    elif OS == 'Darwin':
        print(f'Detected System = {OS}')
    else:
        print(f'{OS} not recognized!')
        logging.INFO('{OS} not recognized! ... Exiting :( ')
        os._exit(1)
    return OS

def lin_packages():
    logging.INFO('Validate sudo credentials')
    if os.geteuid() != 0:
        logging.INFO('Root Permissions Needed, Please run with sudo')
        os._exit(1)

    return

def mac_packages():
    return

def lin_tool_install():
    return

def mac_tool_install():
    return

def lin_env_setup():
    return

def mac_env_setup():
    return

def lin_work_flow(OS):
    return

def mac_work_flow(OS):
    return

if __name__ == '__main__':
    setup(args.log_level.upper())
