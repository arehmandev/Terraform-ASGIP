module "extract" {
  source = "./modules/extract"
  ipfile = "Files/iplist.txt"

  # File ASG IPs will be stored

  asg = "CoreOS-stable-CoreOSServerAutoScale-178PT01VC192E"

  # Replace with variable of your asg.id
}

module "certauth" {
  source   = "./modules/tls/ca"
  capem    = "certauth.pem"
  keypem   = "certauthkey.pem"
  iplistca = "${split(",", module.extract.ipcontent)}"

  # Output ipcontent contains the formatted list of IPs
}

module "etcd-ca" {
  source             = "./modules/tls/etcd"
  capem              = "etcd.pem"
  keypem             = "etcdkey.pem"
  iplistca           = "${split(",", module.extract.ipcontent)}"
  ca_cert_pem        = "${module.certauth.ca_cert_pem}"
  ca_private_key_pem = "${module.certauth.ca_private_key_pem}"
}
