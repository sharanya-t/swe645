pipeline {
    environment {
        registry = "sthilagan98/hw2"
        registryCredential = 'dockerhub'
        dockerImage = ''
        warFileName = "survey.war"
        kubeconfig = "/var/ubuntu/.kube/config"  
        deploymentName = "hw2-cluster-deployment"  
        rancherClusterName = "cluster-1"  
    }
    agent any
    
    stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/sharanya-t/swe645.git'
                withAnt(installation: 'Ant1.10.7') {
                    sh '''
                    #!/bin/bash
                    cd ~/workspace/swe645
                    ls
                    ant war
                    '''
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Building...'
                script {
                    dockerImage = docker.build("${registry}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Deploy Image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Redeploy') {
            steps {
                echo 'Redeploying....'
                sh '''
                #!/bin/bash
                docker login
                docker pull ${registry}:${BUILD_NUMBER}
                source /etc/environment
                kubectl --kubeconfig ${kubeconfig} set image deployment/${deploymentName} ${deploymentName}=docker.io/${registry}:${BUILD_NUMBER}
                '''
            }
        }

        stage('Remove Unused docker image') {
            steps {
                sh "docker rmi ${registry}:${BUILD_NUMBER}"
            }
        }
    }
}