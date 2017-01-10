# Extract Autoscaling Group IPs (AWS)

This module (extract) was written as a workaround to get the IPs of AWS autoscaling groups.

I have also provided an example of how this is implemented e.g. TLS cert generation, upload to S3 bucket and encryption of object via KMS!

### Module structure
```
module "extract" {
  source = "./modules/extract"
  ipfile = "Files/iplist.txt"
  # File ASG IPs will be stored

  asg = "CoreOS-stable-CoreOSServerAutoScale-1WLSJILDWS3NT"
  # Replace with variable of your asg.id
}
```


### Details:
```
1. To get the IPs, simply name the filepath you wish to save them to (e.g. ipfile = "Files/iplist.txt").
Note: Due to template bug you may have to "touch" this file prior to use in module.

2. Then enter your autoscaling group id as a variable for the asg input (e.g. asg = "${module.asg.asg_id}".

3. Your autoscaling group IP list is now given off as a "string output", so to reference it as a list just use split e.g:

${split(",", module.extract.ipcontent)}
```
