variable "name" {
  type        = string
  description = "Value for Name tag"
}

variable "force_destroy" {
  default     = true
  type        = bool
  description = "Force destroy bucket"
}

variable "versioning" {
  default     = false
  type        = bool
  description = "Enable versioning for bucket"
}

variable "region" {
  description = "Region"
  type        = string
}
