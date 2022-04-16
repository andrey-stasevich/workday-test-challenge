# How to run
Please use `run.sh` to start the terraform apply. In addition to apply it also installs `tfenv` and installs `terraform@1.1.8`

# Questions to think about
* What type of security concerns do you have around the VPC? \
  We need to use Security groups and Network Access Control Lists to limit network access to our services. \
  IAM Policies should be used to manage user access to services \ 
  Default VPC usage should be avoided and custom VPCs should be created \
  Critical private services like DBs, Cache as well as EC2 instances should be moved to private subnets to limit the access from outside VPN/VPC. Access to services should be done through ALB/NLB that should be placed to public subnets
* What questions do you have about the 2 users that have full admin access? \
  Least permissions are better. Usually it's a bad practice to give full admin access to users, as well as giving AWS inline policies. The best practices recommend to create custom groups with strictly defined policies and assign users into appropriate groups.  
* What security precautions would you take for system users vs. human users? \
  System users should not have login credentials attached to their profiles, they have to use API keys. Moreover, I would avoid usage of system users with constant API keys, the instance profiles and strict IAM policies which service can access anothers would be more beneficial.\
  For human users it's nice to have MFA enabled and setup password policy and rotation period for all passwords.
  