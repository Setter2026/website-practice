terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Configure the provider to connect to your local Linux Docker daemon
provider "docker" {}

# 1. Tell Terraform to download a specific image from the web
resource "docker_image" "nginx_blueprint" {
  name         = "nginx:latest"
  keep_locally = false
}

# 2. Tell Terraform to start a live running container using that image
resource "docker_container" "nginx_server {
  image = docker_image.nginx_blueprint.image_id
  name  = "platform-managed-web-server"
  
  ports {
    internal = 80
    external = 8080
  }
}