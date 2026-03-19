pipeline {
    agent {
        label 'slave-1'
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/127rutu/project.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                cp target/*.war /opt/tomcat/webapps/
                '''
            }
        }
    }
}
