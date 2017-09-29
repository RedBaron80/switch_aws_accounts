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
ec2 = boto3.resource('ec2', region_name='us-west-1')

# Collect tag, value & username
args = parseArguments()

# Get ec2 running machines metadata
instances = ec2.instances.filter(
    Filters=[
                {'Name': 'tag:'+ args.tag +'', 'Values': [''+ args.tagValue +'']},
                {'Name': 'instance-state-name', 'Values': ['running']}
        ])

# Filtering ip addresses
instances_ips = ''
for instance in instances:
    instances_ips = instances_ips + instance.private_ip_address + ','
instances_ips = instances_ips[:-1] #remove last separator

#Adding profile colours and env variables
profile = ''
if args.tag == 'connectapi':
        profile = ' -p Green'
elif args.tag == 'connectqueue':
        profile = ' -p White'
elif args.tagValue == 'prod':
        profile = ' -p Green'

# Executing the command
print("i2cssh -b -l "+ args.username +" -m " + instances_ips + profile)
os.system("i2cssh -b -l "+ args.username +" -m " + instances_ips + profile)
