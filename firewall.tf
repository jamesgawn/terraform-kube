resource "civo_firewall" "kube-firewall" {
    name = "kube-firewall"
}

resource "civo_firewall_rule" "kube-access" {
    firewall_id = civo_firewall.kube-firewall.id
    protocol = "tcp"
    start_port = "6443"
    end_port = "6443"
    cidr = ["${local.public_ip}/32"]
    direction = "ingress"
    label = "kubernetes-api-server"
}

resource "civo_firewall_rule" "http" {
    firewall_id = civo_firewall.kube-firewall.id
    protocol = "tcp"
    start_port = "80"
    end_port = "80"
    cidr = ["0.0.0.0/0"]
    direction = "ingress"
    label = "http"
}

resource "civo_firewall_rule" "https" {
    firewall_id = civo_firewall.kube-firewall.id
    protocol = "tcp"
    start_port = "443"
    end_port = "443"
    cidr = ["0.0.0.0/0"]
    direction = "ingress"
    label = "https"
}