pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = 'us-east-1'
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Install Dependencies') {
      steps {
        bat 'python -m pip install pandas openpyxl''
      }
    }

    stage('Generate tfvars') {
      steps {
        bat 'python excel_to_tfvars.py'
      }
    }

    stage('Terraform Init') {
      steps {
        bat 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        bat 'terraform plan -var-file=terraform.tfvars.json'
      }
    }

    stage('Terraform Apply') {
      steps {
        bat 'terraform apply -auto-approve -var-file=terraform.tfvars.json'
      }
    }
  }
}
