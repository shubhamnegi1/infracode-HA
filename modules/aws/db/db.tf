#auroraDB
resource "aws_rds_cluster" "db_cluster" {
  cluster_identifier                  = "cluster-${var.db_name}"
  deletion_protection                 = var.deletion_protection
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  master_username                     = var.master_username
  master_password                     = var.master_password
}

resource "aws_rds_cluster_instance" "db_cluster_instances" {
  count                           = var.db_instance_count
  identifier                      = "cluster-${var.db_name}-instance-${count.index}"
  cluster_identifier              = aws_rds_cluster.db_cluster.cluster_identifier
  engine                          = var.db_engine
  engine_version                  = var.db_engine_version
  instance_class                  = var.db_instance_class
  publicly_accessible             = false
}
