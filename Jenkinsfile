pipeline {
    environment {
        registry = "sthilagan98/hw2"
        registryCredential = 'dockerhub'
        dockerImage = ''
        warFileName = "survey.war"
        kubeconfig = "/var/lib/jenkins/.kube/config"  
        deploymentName = "hw2-cluster-deployment"  
        rancherClusterName = "cluster-1"
    }
    agent any
    
    stages {
        stage("Creating war file"){
            steps{
                script{
                    checkout scm
                    sh 'rm -rf *.war'
                    sh 'jar -cvf survey.war -C swe645/ .'
                    sh 'echo ${BUILD_TIMESTAMP}'
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
                sh 'kubectl set image deployment/lb1 container-0=sthilagan98/hw2:${BUILD_NUMBER}'
            }
        }
    }
}