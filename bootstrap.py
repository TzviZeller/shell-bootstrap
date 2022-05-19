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

def setup(operatingSystem):
    """_summary_

    Args:
        operatingSystem (_type_): _description_
    """
    # Setup Logging
    log_level = args.loglevel.upper()
    if log_level not in ('DEBUG', 'INFO', 'WARNING', 'ERROR','CRITICAL'):
        log_level = 'INFO'
    logformat='%(asctime)s - %(levelname)s - %(message)s'
    logging.basicConfig(filename='example.log', filemode='w', format=logformat)
    logging.getLogger().setLevel(log_level)
    logging.info('####Boostrap Start####')

    # Determine Operating System
    logging.info(platform.uname())
    if operatingSystem == 'Linux':
        print(f"Detected System = {operatingSystem}")
    elif operatingSystem == 'Darwin':
        print(f'Detected System = {operatingSystem}')
    else:
        print(f'{operatingSystem} not recognized!')
        # Pylint says I have to use f'%s' here
        logging.info('%s not recognized! ... Exiting :( ' ,operatingSystem)
        os._exit(1)
    return

def lin_packages():
    """_summary_
    """
    logging.info('Validating sudo credentials')
    if not 'SUDO_UID' in os.environ.keys():
        logging.info('Root Permissions Needed, Please run as root!')
        sys.exit('Root Permissions Needed, Please run as root!')
    return

def lin_env_setup():
    """_summary_
    """
    return

def mac_env_setup():
    """_summary_
    """
    return

def lin_tool_install():
    """_summary_
    """
    return

def mac_tool_install():
    """_summary_
    """
    return

if __name__ == '__main__':
    operatingSystem = platform.system()
    setup(operatingSystem)
    if operatingSystem == 'Linux':
        lin_packages()
        lin_env_setup()
        lin_tool_install()
    elif operatingSystem == 'Darwin':
        mac_env_setup()
        mac_tool_install()
