resource "aws_db_parameter_group" "default" {
  name   = "rds-pg"
  family = "mysql5.6"
}
resource "aws_db_instance" "default" {
  allocated_storage           = 10
  db_name                     = "SimpleJenkinsDB"
  engine                      = "MySQL"
  engine_version              = "8.0.32"
  instance_class              = "db.t3.micro"
  manage_master_user_password = true
  username                    = "admin"
  parameter_group_name        = aws_db_parameter_group.default.name 
}