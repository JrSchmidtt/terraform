terraform {
    required_providers {
        archive = {
            source = "hashicorp/archive"
            version = "2.4.1"
        }
    }
}

# declare resource with name "zipfile" that will create a zip file from the contents of the data directory.
resource "archive_file" "zipfile" { 
    type = "zip"
    source_dir = "data"
    output_path = "backup.zip"
}

# print the output path of the zip file
output "zipfile" {
    value = archive_file.zipfile.output_path
}