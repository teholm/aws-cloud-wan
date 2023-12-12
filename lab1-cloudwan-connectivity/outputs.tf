# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# --- root/outputs.tf ---

output "vpcs" {
  description = "VPCs created."
  value = {
    oregon = {
      spoke      = { for k, v in module.oregon_spoke_vpcs : k => v.vpc_attributes.id }
    }
    ohio = {
      spoke      = { for k, v in module.ohio_spoke_vpcs : k => v.vpc_attributes.id }
      legacy     = module.ohio_legacy_vpc.vpc_attributes.id
    }
  }
}

output "cloud_wan" {
  description = "AWS Cloud WAN resources."
  value = {
    global_network_id = aws_networkmanager_global_network.global_network.id
    core_network_id   = awscc_networkmanager_core_network.core_network.core_network_id
  }
}

output "transit_gateway" {
  description = "AWS Transit Gateway resources."
  value = {
    #oregon    = aws_ec2_transit_gateway.oregon_tgw.id
    ohio     = aws_ec2_transit_gateway.ohio_tgw.id
  }
}