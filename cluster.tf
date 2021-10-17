resource "civo_kubernetes_cluster" "gawn-kube" {
    name = "gawn-kube"
    applications = ""
    num_target_nodes = 2
    target_nodes_size = "g3.k3s.medium"
    firewall_id = civo_firewall.kube-firewall.id
}

output "kube-master-ip" {
    value = civo_kubernetes_cluster.gawn-kube.master_ip
}

output "kube-dns" {
    value = civo_kubernetes_cluster.gawn-kube.dns_entry
}