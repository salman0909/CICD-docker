pipeline {
    agent any
    environment {
        IMAGE='my-flask-app'
	      TAG='latest'
    }
   stages {
       stage('Build') {
           steps {
	             sh 'docker build -t ${IMAGE}:{TAG} .'
           }
       }
       stage('push to docker hub') {
           steps {
	             withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUsername')]) {
               
	             sh 'docker push salman1091/${IMAGE}:{TAG}'
           }
       }
       stage('Run container on Jenkins Agent') {
	         steps {
	             sh 'docker container run -d -p 8082:82 salman1091/${IMAGE}:{TAG}'
          }
       } 
   }
}
}
