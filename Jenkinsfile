pipeline {
    environment {
        registry = "sthilagan98/hw2"
        registryCredential = 'dockerhub'
        dockerImage = ''
        warFileName = "survey.war"
        kubeconfig = "/var/lib/jenkins/.kube/config"  
        deploymentName = "hw2-cluster-deployment"  
        rancherClusterName = "cluster-1"  
        DOCKERHUB_PASS = credentials('docker-pass')
    }
    agent any
    
    stages {
        stage("Creating war file and docker image"){
            steps{
                script{
                    checkout scm
                    sh 'rm -rf *.war'
                    sh 'jar -cvf survey.war -C swe645/ .'
                    sh 'echo ${BUILD_TIMESTAMP}'
                    echo 'whoami?'
                    sh 'whoami'
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
    }
}