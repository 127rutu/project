pipeline {
    agent { label 'slave-1' }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/127rutu/project.git'
            }
        }

        stage('Build') {
            steps {
                sh '/mnt/build-tools/apache-maven-3.9.14/bin/mvn clean install'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                cp target/*.war /mnt/servers/apache-tomcat-10.1.52/webapps/
                '''
            }
        }
    }
}

