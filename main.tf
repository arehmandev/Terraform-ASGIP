module "extract" {
  source = "./extract"
  ipfile = "Files/iplist.txt"
# File ASG IPs will be stored

  asg = "CoreOS-stable-CoreOSServerAutoScale-19N2DDQBHJQA2"
# Replace with variable of your asg.id
}

module "certauth" {
  source   = "./ca"
  capem    = "certauth.pem"
  keypem   = "certauthkey.pem"
  iplistca = "${module.extract.ipcontent}"

  # Output ipcontent contains the formatted list of IPs
}
