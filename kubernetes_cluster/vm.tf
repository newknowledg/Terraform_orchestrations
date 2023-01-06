provider "xenorchestra" {
}

data "xenorchestra_pool" "pool" {
  name_label = "xcp-ng-Homelab"
}

data "xenorchestra_template" "template" {
  name_label = "AMI"
}

data "xenorchestra_sr" "sr" {
  name_label = "Local storage"
  pool_id = data.xenorchestra_pool.pool.id
}

data "xenorchestra_network" "network" {
  name_label = "Internal"
  pool_id = data.xenorchestra_pool.pool.id
}

resource "xenorchestra_vm" "vm" {
  memory_max = 2147467264
  cpus = 2
  name_label = "Kubernetes"
  template = data.xenorchestra_template.template.id
  wait_for_ip = true
  auto_poweron = true

  network {
    network_id = data.xenorchestra_network.network.id
  }

  disk {
    sr_id = data.xenorchestra_sr.sr.id
    name_label = "VM root volume"
    size = 53687091200
  }
}

resource "xenorchestra_vm" "vm2" {
  memory_max = 2147467264
  cpus = 2
  name_label = "Kubernetes-2"
  template = data.xenorchestra_template.template.id
  wait_for_ip = true
  auto_poweron = true

  network {
    network_id = data.xenorchestra_network.network.id
  }

  disk {
    sr_id = data.xenorchestra_sr.sr.id
    name_label = "VM root volume"
    size = 53687091200
  }
}

resource "xenorchestra_vm" "vm3" {
  memory_max = 2147467264
  cpus = 2
  name_label = "Kubernetes-3"
  template = data.xenorchestra_template.template.id
  wait_for_ip = true
  auto_poweron = true

  network {
    network_id = data.xenorchestra_network.network.id
  }

  disk {
    sr_id = data.xenorchestra_sr.sr.id
    name_label = "VM root volume"
    size = 53687091200
  }
}

output "all-ipv4-ips-for-vm" {
  value = xenorchestra_vm.vm.ipv4_addresses
}

output "all-ipv4-ips-for-vm2" {
  value = xenorchestra_vm.vm2.ipv4_addresses
}

output "all-ipv4-ips-for-vm3" {
  value = xenorchestra_vm.vm3.ipv4_addresses
}
