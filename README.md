# Extract Autoscaling Group IPs (AWS)

This module (extract) was written as a workaround to get the IPs of AWS autoscaling groups.

I have also provided an example of how this is implemented e.g. TLS cert generation, upload to S3 bucket and encryption of object via KMS!

Details:
```
To get the IPs, simply name the filepath you wish to save them to (e.g. ipfile = "Files/iplist.txt"). Due to template bug you may have to "touch" this file prior to use in module.

Then enter your autoscaling group id as a variable for the asg input (e.g. asg = "${module.asg.asg_id}".

Your autoscaling group IP list is now given off as a "string output", so to use it in a list just use split:
${split(",", module.extract.ipcontent)}
```
