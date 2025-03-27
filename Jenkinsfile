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
    }
    
    post {
        always {
            archiveArtifacts artifacts: 'trivy-results.json', fingerprint: true
        }
    }
}