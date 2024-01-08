properties([parameters([choice(choices: ['Terraform-ECS-Fargate'], name: 'Terraform-ECS-Fargate'), choice(choices: ['plan', 'apply', 'destroy'], name: 'Terraform_Action')])])
pipeline {
    agent any
    environment {
        registry = "public.ecr.aws/g2b6m8b9/helloworldrepo"
    }    
    stages {
        stage('Preparing') {
            steps {
                sh 'echo Preparing'
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    dir('terraform/accounts/dev/remote_state/'){
                    sh 'terraform init -backend-config=backend'
                    sh "terraform destroy --auto-approve"
                    sh 'echo "destroyed"'                                                                                   
                }}
            }
        }
        
    }
         
    }
