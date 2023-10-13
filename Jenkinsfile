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
        stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/sharanya-t/swe645.git'
                withAnt(installation: 'Ant1.10.7') {
                    sh '''
                    #!/bin/bash
                    cd ~/workspace/swe645/swe645
                    ls
                    ant war
                    '''
                }
            }
        }
        // stage("Creating war file and docker image"){
        //     steps{
        //         script{
        //             checkout scm
        //             sh 'rm -rf *.war'
        //             sh 'jar -cvf survey.war -C swe645/ .'
        //             echo 'pwd -'
        //             sh 'pwd'
        //             sh 'echo ${BUILD_TIMESTAMP}'
        //         }
        //     }
        // }
        // stage('Build') {
        //     steps {
        //         echo 'Building...'
        //         script {
        //             dockerImage = docker.build("${registry}:${BUILD_NUMBER}")
        //         }
        //     }
        // }
    }
}