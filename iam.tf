resource "aws_iam_role" "elastic_beanstalk_ec2_role" {
  name = "elastic_beanstalk_ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    created-by = var.creator
  }
}

resource "aws_iam_instance_profile" "elastic_beanstalk_ec2_profile" {
  name = "test_profile"
  role = aws_iam_role.elastic_beanstalk_ec2_role.name
}
