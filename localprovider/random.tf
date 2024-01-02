terraform {
    required_providers {
        random = {
            source = "hashicorp/random"
            version = "3.6.0"
        }
    }
}

resource "random_string" "random" {
    length = 16
    special = false
    upper = false
}

output "random" {
    value = random_string.random.result
}