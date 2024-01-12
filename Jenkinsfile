pipeline {
    agent any
	environment {
        dockerhubCredentials = 'dockerhub'
        dockerImageTag = "salman1091/my-flask-app:0.01"
    }
   
   stages {
       stage('Build') {
           steps {
	       sh 'docker login'
	       sh "docker build -t $dockerImageTag ."
	       //sh 'docker tag  salman1091/my-flask-app'
           }
       }
       stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', dockerhubCredentials) {
                        sh "docker push $dockerImageTag"
                    }
                }
            }
       }
       stage('Run container on Jenkins Agent') {
           steps {
	       sh 'docker container run -d -p  8081:81 $dockerImageTag'
          }
       } 
   }
}

