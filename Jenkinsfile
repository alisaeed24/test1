pipeline {
    agent {
        label 'jenkins-agent'
    }
    tools {
        maven 'Maven3'
    }
    stages {
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from SCM') {
            steps {
                git branch: 'main', credentialsId: 'gitlab', url: 'https://github.com/alisaeed24/test1'
            }
        }
        stage('Build App') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('Test App') {
            steps {
                sh "mvn test"
            }
        }
        stage('Sonarqube Analysis') {
            steps {
                withSonarQubeEnv(installationName: 'sonarqube-scanner', credentialsId: 'jenkins-sonarqube-token') {
                    sh "mvn sonar:sonar"
                }
            }
        }
        stage('Quality Gate') {
            steps {
                script{
                    waitForQualityGate abortPipeline: false, credentialsId: 'jenkins-sonarqube-token'
                }
            }
        }
    }
}
