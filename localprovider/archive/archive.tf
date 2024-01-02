terraform {
    required_providers {
        archive = {
            source = "hashicorp/archive"
            version = "2.4.1"
        }
        random = {
            source = "hashicorp/random"
            version = "3.6.0"
        }
    }
}

# declare resource with name "random" that will generate a random string
resource "random_string" "random" {
    length = 10
    special = false
    upper = false
}

# declare resource with name "zipfile" that will create a zip file from the contents of the data directory.
resource "archive_file" "zipfile" { 
    type = "zip"
    source_dir = "data"
    output_path = "${random_string.random.result}.zip"
}

# print the output path of the zip file
output "zipfile" {
    value = archive_file.zipfile.output_path
}

# print the random string
output "random" {
    value = random_string.random.result
}