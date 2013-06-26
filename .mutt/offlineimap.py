#!/usr/bin/python
import re, commands, subprocess
def get_keychain_pass(account=None, server=None):
    params = {
        'security' : '/usr/bin/security',
        'command'  : 'find-internet-password',
        'account'  : account,
        'server'   : server,
        #'keychain' : '/Users/VatRaghavan/Library/Keychains/login.keychain',
    }
    #command = "%(security)s -v %(command)s -w -g -a %(account)s -s %(server)s %(keychain)s" % params
    command = "%(security)s -v %(command)s -w -g -a %(account)s -s %(server)s " % params
    #print "command = ", command
    #output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT).rstrip()
    outtext = commands.getoutput(command)
    print "output = ", outtext
    #return re.match(r'password: "(.*)"', outtext).group(1)
    return outtext.rstrip()
