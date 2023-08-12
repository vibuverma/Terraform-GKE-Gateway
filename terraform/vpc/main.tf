module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 7.2"

    project_id   = var.project_id
    network_name = var.vpc_name
    routing_mode = var.routing_mode

    subnets = [
        {
            subnet_name           = var.subnet_1.subnet_name
            subnet_ip             = var.subnet_1.subnet_ip
            subnet_region         = var.subnet_1.subnet_region
            subnet_private_access = var.subnet_1.subnet_private_access
            subnet_flow_logs      = var.subnet_1.subnet_flow_logs
            description           = var.subnet_1.description
        },
        {
            subnet_name           = var.subnet_2.subnet_name
            subnet_ip             = var.subnet_2.subnet_ip
            subnet_region         = var.subnet_2.subnet_region
            subnet_private_access = var.subnet_2.subnet_private_access
            subnet_flow_logs      = var.subnet_2.subnet_flow_logs
            description           = var.subnet_2.description

        }
    ]

    secondary_ranges = {
        var.subnet_1.subnet_name = [
            {
                range_name    = secondary_ranges_1.range_name
                ip_cidr_range = secondary_ranges_1.ip_cidr_range
            },
        ]

        subnet-02 = []
    }

    routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        },
    ]
}