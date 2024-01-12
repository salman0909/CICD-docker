pipeline {
    agent any
   
   stages {
       stage('Build') {
           steps {
	       sh 'docker login'
	       sh 'docker image build -t my-flask-app:0.01 .'
	       //sh 'docker tag  salman1091/my-flask-app'
           }
       }
       stage('push to docker hub') {
           steps {
	       withDockerRegistry([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUsername')]) {
               
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

