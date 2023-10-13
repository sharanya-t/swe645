pipeline{
    agent any
    environment {
        DOCKERHUB_PASS = credentials('docker-pass')
    }
    stages {
        stage("Building the Student Survey Image") {
            steps {
                script {
                    checkout scm
                    
                    sh 'rm -rf *.war'
                    sh 'jar -cvf survey.war -C swe645 .'
                    sh 'echo ${BUILD_TIMESTAMP}'
                    sh "docker login -u sthilagan98 -p ${DOCKERHUB_PASS}"
                    sh 'docker build -t sthilagan98/hw2:${BUILD_TIMESTAMP} .'

                }
            }
        }
    stage("Pushing Image to DockerHub") {
        steps {
            script {
                sh 'docker push sthilagan98/hw2:${BUILD_TIMESTAMP}'
            }
        }
    }
    stage("Deploying to Rancher as single pod") {
        steps{
            sh 'kubectl set image deployment/node-port container-0=sthilagan98/hw2:${BUILD_TIMESTAMP}'
        }
    }
    stage("Deploying to Rancher as load balancer"){
        steps {
            sh 'kubectl set image deployment/loadbalancer-2 container-0=sthilagan98/hw2:${BUILD_TIMESTAMP}'
        }
    }
    }
}
