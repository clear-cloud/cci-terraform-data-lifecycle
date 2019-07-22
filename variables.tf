variable "interval" {
  default = "24"
}

variable "retention" {
  default = "7"
}

variable "target_tags_map" {
  type = "map"
}

variable "state" {
  default = "ENABLED"
}

variable "copy_tags" {
  default = "true"
}

variable "name" {}

variable "times" {
  description = "Time to run the backup"
  default     = "02:15"
}
