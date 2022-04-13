resource "aws_iam_role" "chatbot_role" {
  name = "${var.configuration_name}_chatbot_role"
  assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
    {
    "Sid": "",
    "Effect": "Allow",
    "Principal": {
        "Service": [
        "ec2.amazonaws.com"
        ]
    },
    "Action": "sts:AssumeRole"
    }
]
}
EOF

  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "cloudwatch-readonly-policy-attachment" {
  role       = aws_iam_role.chatbot_role.id
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}
