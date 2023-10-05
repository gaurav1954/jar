pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'gaurav1954/fun'
    }

    stages {
        stage('Docker Build') {
            steps {
                // Build the Docker image
                sh "docker build -t $DOCKER_IMAGE_NAME ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Log in to Docker Hub
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                }

                // Push the Docker image to Docker Hub
                sh "docker push $DOCKER_IMAGE_NAME"
            }
        }
    }
    post{
         success{
            sh 'docker system prune -a --filter until=20s'
        }
    }
    
}
