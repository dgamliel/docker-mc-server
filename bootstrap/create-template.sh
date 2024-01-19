#!/bin/bash

# Define variables
TEMPLATE_NAME="MySpotInstanceTemplate"  # Replace with your desired template name
INSTANCE_TYPE="a1.large"
IMAGE_ID="ami-xxxxxxxxxxxx"  # Replace with the AMI ID you wish to use
KEY_NAME="my-key-pair"       # Replace with your key pair name
SECURITY_GROUP_ID="sg-xxxxxxxxxxxx"  # Replace with your security group ID
SUBNET_ID="subnet-xxxxxxxxxxxx"      # Replace with your subnet ID

# Create a Launch Template for an EC2 Spot Instance
aws ec2 create-launch-template \
    --launch-template-name "$TEMPLATE_NAME" \
    --version-description "Spot Instance Template" \
    --launch-template-data \
        "{
            \"InstanceType\": \"$INSTANCE_TYPE\",
            \"ImageId\": \"$IMAGE_ID\",
            \"KeyName\": \"$KEY_NAME\",
            \"SecurityGroupIds\": [\"$SECURITY_GROUP_ID\"],
            \"InstanceMarketOptions\": {
                \"MarketType\": \"spot\",
                \"SpotOptions\": {
                    \"SpotInstanceType\": \"one-time\",
                    \"InstanceInterruptionBehavior\": \"terminate\"
                }
            },
            \"NetworkInterfaces\": [
                {
                    \"DeviceIndex\": 0,
                    \"SubnetId\": \"$SUBNET_ID\",
                    \"AssociatePublicIpAddress\": true,
                    \"Groups\": [\"$SECURITY_GROUP_ID\"]
                }
            ]
        }"

echo "Launch Template created successfully."
