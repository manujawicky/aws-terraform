resource "aws_iam_role" "s3accessrole" {
  name = "s3readonly"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_policy" "iampolicy" {
  name        = "iam-policy"
  description = "A test policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3-object-lambda:Get*",
                "s3-object-lambda:List*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "iaminstanceprofile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.s3accessrole.name
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.s3accessrole.name
  policy_arn = aws_iam_policy.iampolicy.arn
}