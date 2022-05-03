#

import argparse
import platform
import logging
import sys
import os

argparse = argparse.ArgumentParser()
argparse.add_argument('-l','--logLevel', default='INFO', help='')
OS = None

def setup():
    print('Starting Setup :)')
    if logLevel in ('DEBUG', 'INFO', 'WARNING', 'ERROR','CRITICAL'):
        print('{OS} not recognized!')
        logging.ERROR('{OS} not recognized! ... Exiting :( ')
        os._exit(1)
    logging.basicConfig(filename='example.log', encoding='utf-8', level=logging.DEBUG)

    #Determine OS
    OS = platform.system()
    logging.INFO(platform.platform())
    logging.DEBUG(platform.platform())
    if OS == 'Linux':
        print('Detected System = {OS}')
    elif OS == 'Darwin':
        print('Detected System = {OS}')
    else:
        print('{OS} not recognized!')
        logging.ERROR('{OS} not recognized! ... Exiting :( ')
        os._exit(1)

    return

def linPackages():
    return

def macPackages():
    return

def linToolInstall():
    return

def macToolInstall():
    return

def linEnvSetup():
    return

def macEnvSetup():
    return

if __name__ == '__main__':
    setup()