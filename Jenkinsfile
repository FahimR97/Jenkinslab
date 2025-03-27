pipeline {
    agent any
    
    stages {
        stage('Preparation') {
            steps {
                sh '''
                    docker system prune -f
                    docker network create my-network || true
                '''
            }
        }
        
        stage('Build Images') {
            steps {
                sh '''
                    docker build -t my-flask-app .
                '''
            }
        }
        
        stage('Security Scan') {
            steps {
                sh '''
                    trivy image my-flask-app --format json --output trivy-results.json
                '''
            }
        }
        
        stage('Run Container') {
            steps {
                sh '''
                    docker stop flask-app || true
                    docker rm flask-app || true
                    docker run -d --name flask-app -p 80:80 my-flask-app
                    sleep 10
                '''
            }
        }
    }
    
    post {
        always {
            archiveArtifacts artifacts: 'trivy-results.json', fingerprint: true
        }
    }
}