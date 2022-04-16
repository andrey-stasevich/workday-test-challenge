variable "name" {
  type        = string
  description = "User name"
}

variable "system" {
  type        = bool
  default     = false
  description = "Determines whether the user is system or human"
}

variable "pgp_key" {
  type        = string
  default     = "keybase:test"
  description = "PGP Key for user creation"
}
