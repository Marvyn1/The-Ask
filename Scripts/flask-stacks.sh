#!/bin/bash

#This script should be ran in the same directory of your templates, otherwise you'll need to ammend the template locations.

# Function to check the stack creation status
check_stack_status() {
	  stack_name=$1
	    aws cloudformation wait stack-create-complete --stack-name $stack_name
	      echo "Stack $stack_name created successfully"
      }

      # Create Stack 1
      stack_name1="VPC"
      template_file1="vpc.yml"
      aws cloudformation create-stack --stack-name $stack_name1 --template-body file://./$template_file1
      check_stack_status $stack_name1

      # Create Stack 2
      stack_name2="iam"
      template_file2="iam.yml"
      aws cloudformation create-stack --stack-name $stack_name2 --capabilities CAPABILITY_NAMED_IAM --template-body file://./$template_file2
      check_stack_status $stack_name2

      # Create Stack 3
      stack_name3="app-cluster"
      template_file3="app-cluster.yml"
      aws cloudformation create-stack --stack-name $stack_name3 --template-body file://./$template_file3
      check_stack_status $stack_name3

      # Create Stack 4
      stack_name4="api"
      template_file4="api.yml"
      aws cloudformation create-stack --stack-name $stack_name4 --template-body file://./$template_file4
      check_stack_status $stack_name4

      echo "All stacks created successfully"
