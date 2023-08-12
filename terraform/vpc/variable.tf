variable "project_id" {
  type        = string
  description = "The project ID to manage the Cloud SQL resources"
}
  
variable "vpc_name" {
    type        = string
    description = "The name of the VPC"
}


variable "routing_mode" {
    type        = string
    description = "The routing mode of the VPC"
    default     = "GLOBAL"
}

variable "subnet_1" {
    type = object({
      subnet_name = string
      subnet_ip = string
      subnet_region = string
      subnet_private_access = bool
      subnet_flow_logs = bool
      description = string
    })
  
}

variable "subnet_2" {
    type = object({
      subnet_name = string
      subnet_ip = string
      subnet_region = string
      subnet_private_access = bool
      subnet_flow_logs = bool
      description = string
    })
  
}

variable "secondary_ranges_1" {
    type = object({
      range_name = string
      ip_cidr_range = string
    })
  
}