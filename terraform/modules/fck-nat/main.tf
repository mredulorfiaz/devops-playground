module "fck-nat" {
  source = "RaJiska/fck-nat/aws"

  name      = var.name
  vpc_id    = data.aws_vpc.vpc.id
  subnet_id = data.aws_subnets.subnets.ids[0]

  update_route_tables = true
  route_tables_ids    = { for id in data.aws_route_tables.rts.ids : id => id }
}
