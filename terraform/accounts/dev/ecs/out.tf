output "web_endpoint" {
  value = "http://${aws_lb.hello.dns_name}"
  description = "hit this url to access web server"
}

output "ecr_repo_url" {
  value = "public.ecr.aws/g2b6m8b9/helloworldrepo"
  description = "url where the docker image is to be pushed"
}
