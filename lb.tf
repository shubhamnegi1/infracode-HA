module "alb" {
  source = "./modules/aws/lb"
  name = "test-alb"

  load_balancer_type = "application"
  internal= "false"
  vpc_id  = "module.vpc.vpc_id"
  subnets =["module.vpc.private_subnet_id[0]","module.vpc.private_subnet_id[1]"]
  
  target_groups = [
    {
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"
    }
  ]
  http_alb_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}