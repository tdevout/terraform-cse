variable "region" {
  default = "europe-west2"
}

variable "zone" {
  default = "europe-west2-b"
}

variable "name" {
  description = "Name prefix"
  default     = "cse"
}

variable "project" {
  description = "Project Name"
  default     = "c-s-exercise"
}

variable "machine" {
  description = "Machine Type"
  default     = "e2-medium"
}

variable "ports" {
  description = "Firewall Ports"
  type = list
  default = [
    "22",
    "80",
    "443",
    "8443"
  ]
}