variable "managed_zone" {
    type = string
    description = "This is the zone that is going to contain the DNS record, remember that the only one that is able to create zones is HSBC"
}

variable "network_ips" {
    description = "This is an array of ipss"
}