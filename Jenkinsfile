pipeline {
    agent { label 'built-in' }

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

        stage('copying to slave') {
            steps {
               sh 'scp -i /root/.ssh/jenkins_key target/LoginWebApp.war ec2-user@172.31.34.9:/mnt/servers/apache-tomcat-10.1.52/webapps/'
            }
        }
    }
}
