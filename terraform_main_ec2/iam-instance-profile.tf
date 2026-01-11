resource "aws_iam_instance_profile" "instance-profile" {
  name = "hotstar-iam-instance-profile-ec2"
  role = aws_iam_role.iam-role.name
}
