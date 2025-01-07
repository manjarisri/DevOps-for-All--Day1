terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.26.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx-container"
  ports {
    internal = 80
    external = 8080
  }
}
