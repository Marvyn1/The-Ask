# The Ask

1. To containerize the Flask API

2. To build Infra to deploy the app using ECS. You can:
Use Terraform
Alternative to use AWS cloudformation

3. Create a bash script for deployment to AWS (build and push to ECS) with a health check

4. Provide a simplified playbook (with arch diagram), demonstrating what you have delivered

My Solution:

1. I placed the app.py, Dockerfile, and requirements files in the same directory, then composed and ran the build-push.sh script (found in the Scripts folder). This scripts builds the docker image, creates an AWS ECR repo, authenicates your docker client to AWS (if needed), tags your image in preperation for the push to ECR, and lastly pushes the image to the created ECR repo.

2. I built the Infrastructure required for the app to run in ECS (Fargate) using Cloudformation. The Yaml Stacks can be found in the Infrastructure folder.

3. I composed and ran the flask-stacks.sh script (found in the Script folder). This script creates each stack in order one after an other.
 - Be sure to add your unique ECR repo URI in the api.yml template:
![image](https://github.com/Marvyn1/The-Ask/assets/31973628/e3882635-a269-4d2c-b494-6c3c771ad073)


The architectural diagram of my solution can be found in the Diagram Folder.


