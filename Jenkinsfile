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
        stage('Git Pulling') {
            steps {
                git branch: 'main', url: 'https://github.com/vikram-epi/ecs-hello-world.git'
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    docker.build registry
                }
            }
        }
        stage('Push into ECR') {
            steps {
                sh'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/g2b6m8b9'
                sh'docker build -t hello_world .'
                sh'docker tag helloworldrepo:latest public.ecr.aws/g2b6m8b9/helloworldrepo:latest'
                sh'docker push public.ecr.aws/g2b6m8b9/helloworldrepo:latest'
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    dir('terraform/accounts/dev/remote_state/'){
                    sh 'terraform init'
                                                                                                      
                }}
            }
        }
        
    }
         
    }
