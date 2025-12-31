
locals {
  my_ip       = "154.81.242.32/32" # Replace with your actual IP
  common_tags = {
    Project = "Assignment2"
    Owner   = "Neha"
    Env     = var.env_prefix
  }

  backend_servers = [
    { name = "web-1", script_path = "./scripts/apache-setup.sh", suffix = "web1" },
    { name = "web-2", script_path = "./scripts/apache-setup.sh", suffix = "web2" },
    { name = "web-3", script_path = "./scripts/apache-setup.sh", suffix = "web3" }
  ]
}

