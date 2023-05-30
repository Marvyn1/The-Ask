#!/bin/bash

# Define the repository name
repository_name="flaskapi"

# Build Docker image from the directory containing the Dockerfile, requirements, and app.py
docker build -t flaskapi .

# Create AWS ECR Repository
aws ecr create-repository --repository-name $repository_name

# Authenticate Docker client to registry if you haven't already
aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin $(aws ecr describe-repositories --repository-names $repository_name --query 'repositories[0].repositoryUri' --output text)

# Tag Docker image in preparation for push to ECR
repository_uri=$(aws ecr describe-repositories --repository-names $repository_name --query 'repositories[0].repositoryUri' --output text)
docker tag flaskapi:latest $repository_uri:latest

# Push Docker image to ECR
docker push $repository_uri:latest
