properties([parameters([choice(choices: ['Terraform-ECS-Fargate'], name: 'Terraform-ECS-Fargate'), choice(choices: ['plan', 'apply', 'destroy'], name: 'Terraform_Action')])])
pipeline {
    agent any    
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
                    sh "terraform destroy --auto-approve"
                    sh 'echo "destroyed"'                                                                                   
                }}
            }
        }
        
    }
         
    }
