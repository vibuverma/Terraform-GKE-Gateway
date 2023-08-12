project_id = "project-id"
vpc_name = "private-vpc"
routing_mode = "GLOBAL"
subnet_1 = {
    subnet_name = "private-subnet-1"
    subnet_ip = "10.10.0.0/21"
    subnet_region = "asia-south1"
    subnet_private_access = "false"
    subnet_flow_logs = "false"
    description = "subnet 1 description"
}

subnet_2 = {
    subnet_name = "private-subnet-2"
    subnet_ip = "10.10.0.0/21"
    subnet_region = "asia-south1"
    subnet_private_access = "false"
    subnet_flow_logs = "false"
    description = "subnet 2 description"
}

secondary_ranges_1 = {
  ip_cidr_range = "value"
  range_name = "pod-range"
}