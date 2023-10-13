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
                }
            }
        }
    }
}