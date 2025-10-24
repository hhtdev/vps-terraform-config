terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "portfolio" {
  name         = "hhtdev/hhtdev_portfolio:latest"
  keep_locally = false
}

resource "docker_container" "portfolio" {
  image = docker_image.portfolio.image_id
  name  = var.container_name
  ports {
    internal = 3000
    external = 8080
  }
}
