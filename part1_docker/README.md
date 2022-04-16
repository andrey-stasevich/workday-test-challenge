# How to run
Please use `run.sh` to build and run containers. After successful start the script is waiting for 2 seconds,  tries to execute the call to `http://localhost:8080` to output the response.

# Questions to think about
* How would you test this application? \
  There are different testing frameworks for different purposes:
  * First of all we need unit tests to validate the functionality of each piece of method to be sure that when we change the codebase of the application, we will get the same return value and functionality (Mocha, Chai, etc)
  * For the large applications we need integration tests to check that our application works correctly with the rest part of our service hierarchy (something like Selenium, Kitchen, etc)
  * Next, it would be nice to have infrastructure tests for docker containers - to check when we have a build container image, it contains all required objects - users, files, directories, required packages are installed, processes are started, ports are being listening, etc... We can use Kitchen, Goss, Serverspec, Inspec
* How would you deploy this application \ 
  There are a lot of ways how to deploy dockerized application. We can deploy it on different PaaS like Heroku, Elastic Beanstalk, etc... \
  Talking about deployment on AWS services, here we have a set of different ways how to do it: from simple EC2 instance, then to ECS+Fargate and AWS EKS service. \
  * EC2 provides more simplified setup - just installing docker and running our container, but that gives us a lot of responsibilities on manual/automated resource creation and management
  * ECS and Fargate provides more flexible setup for resource manipulation, but I would say it's suitable for standalone applications that are not tightly coupled with the rest of services.
  * AWS EKS provides abilities for automating deployment, scaling, and management of containerized applications, manages the availability and scalability of the Kubernetes control plane nodes responsible for scheduling containers, managing application availability, storing cluster data, and other key tasks. 
* How would you manage configurations for secrets (ie. the DB password) \
  Secrets should be stored outside the main codebase in such solutions like AWS Secrets Manager or Hasicorp Vault. For Kubernetes we can use standard secrets kind or we can use different integrations with any other external service (AWS Secrets Manager, Vault, etc...)