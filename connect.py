import sys
sys.path.append('/usr/local/lib/python3.7/site-packages')
import boto3
import os
import argparse


def parseArguments():
        # Parsing arguments
        parser = argparse.ArgumentParser()
        parser.add_argument("tag")
        parser.add_argument("tagValue")
        parser.add_argument("username")
        args = parser.parse_args()
        return args

# Let's use Amazon ec2
ec2 = boto3.resource('ec2', region_name='eu-west-1')

# Collect tag, value & username
args = parseArguments()

# Get ec2 running machines metadata
instances = ec2.instances.filter(
    Filters=[
                {'Name': 'tag:'+ args.tag +'', 'Values': [''+ args.tagValue +'']},
                {'Name': 'instance-state-name', 'Values': ['running']}
        ])

try:
    # Filtering ip addresses
    instances_ips = ''
    for instance in instances:
        instances_ips = instances_ips + instance.private_ip_address + ','
    instances_ips = instances_ips[:-1] #remove last separator

    # Executing the command
    if instances_ips:
        print("i2cssh -b -l "+ args.username +" -m " + instances_ips)
        os.system("i2cssh -b -l "+ args.username +" -m " + instances_ips)
    else:
        print("There are no instances for the given tags")
except:
    print "No AWS credentials found. Switch environment?"
