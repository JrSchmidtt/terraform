# declare provider
terraform {
    required_providers {
        random = {
            source = "hashicorp/random"
            version = "3.6.0"
        }
    }
}

# declare resource
resource "random_string" "random" {
    length = 16
    special = false
    upper = false
}

# declare output variable
output "random" {
    value = random_string.random.result
}