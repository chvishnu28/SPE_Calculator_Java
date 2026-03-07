pipeline {
    agent any

    stages {

        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Verify JAR Existence') {
            steps {
                sh 'ls -lh target/'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t scientific-calculator .'
            }
        }

        
stage('Push Docker Image to Docker Hub') {
    steps {
        script {
            docker.withRegistry('', 'dockerhub-cred') {
                sh 'docker tag scientific-calculator vishnuchavala/scientific-calculator:latest'
                sh 'docker push vishnuchavala/scientific-calculator:latest'
            }
        }
    }
}
        stage('Deploy with Ansible') {
            steps {
                sh 'ansible-playbook deploy.yml -i inventory'
            }
        }
    }
}
