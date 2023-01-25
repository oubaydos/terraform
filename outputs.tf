output "kubernetes_instance_ip" {
  value = module.my_instance.instance_ip
}
output "cassandra_instance_ip" {
  value = module.my_instance.cassandra_ip
}