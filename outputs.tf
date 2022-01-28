output "dns_endpoint" {
    value = "http://${aws_elastic_beanstalk_environment.tfenvtest.endpoint_url}/"
}