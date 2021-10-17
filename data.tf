data "civo_instances_size" "medium" {
    filter {
        key = "name"
        values = ["g3.medium"]
        match_by = "re"
    }

    filter {
        key = "type"
        values = ["kubernetes"]
    }
}

data "http" "icanhazip" {
   url = "http://icanhazip.com"
}

locals {
    public_ip = "${chomp(data.http.icanhazip.body)}"
}

data "civo_ssh_key" "personal" {
  name = "Personal Desktop (Windows)"
}