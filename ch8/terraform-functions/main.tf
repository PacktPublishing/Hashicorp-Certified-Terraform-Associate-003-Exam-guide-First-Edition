variable "test-sensitive" {
  type      = string
  sensitive = true
  default   = "test-string-1"
}

variable "test-nonsensitive" {
  type      = string
  sensitive = false
  default   = "test-string-2"
}

output "outval1" {
  value     = var.test-sensitive
  sensitive = true
}

output "outval2" {
  value = var.test-nonsensitive
}




