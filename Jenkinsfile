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
    }
}
