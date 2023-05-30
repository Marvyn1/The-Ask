# CM-DevOps-Test

The ask

1. To containerize the Flask API

2. To build Infra to deploy the app using ECS. You can:
Use Terraform
Alternative to use AWS cloudformation

3. Create a bash script for deployment to AWS (build and push to ECS) with a health check

4. Provide a simplified playbook (with arch diagram), demonstrating what you have delivered

My Solution:

1. I Placed the app.py, Dockerfile, and requirements files in the same directory, then composed and ran the build-and-push.sh script (found in the Script folder). This scripts builds the docker image, creates an AWS ECR Repo, authenicates your docker client to AWS (if needed), tags your image in preperation for the push to ECR, and lastly pushes the image to the created ECR Repo.

2. I built the Infra required for the app to run in ECS using Cloudformation. The Yaml Stacks can be found in Infrastructure folder.

3. I composed and ran the flask-stack.sh script (found in the Script folder). This script creates each stack one after the other.

The architectural diagram of my solution can be found in the Diagram Folder.


