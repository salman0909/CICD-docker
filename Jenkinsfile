pipeline {
    agent any
    environment {
        IMAGE='my-flask-app'
    }
   stages {
       stage('Build') {
           steps {
	       sh 'docker image build -t ${IMAGE}:0.01 .'
           }
       }
       stage('push to docker hub') {
           steps {
	       withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUsername')]) {
               
	       sh 'docker push salman1091/${IMAGE}:0.01'
	       }
           }
       }
       stage('Run container on Jenkins Agent') {
           steps {
	       sh 'docker container run -d -p 8082:82 salman1091/${IMAGE}:0.01'
          }
       } 
   }
}

