output "dns_endpoint" {
    value = aws_elastic_beanstalk_environment.tfenvtest.endpoint_url
}