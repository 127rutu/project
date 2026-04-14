pipeline {
    agent any

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

        stage('Setup Database') {
            steps {
                sh '''
                    chmod -R 777 database.sh
                    ./database.sh
                '''
            }
        }

        stage('Copy WAR to Slave') {
            agent { label 'slave-1' }

            steps {
                sh '''
                    scp -o StrictHostKeyChecking=no \
                    ${WORKSPACE}/target/LoginWebApp.war \
                    root@172.31.40.110:/mnt/servers/apache-tomcat-10.1.52/webapps
                '''
            }
        }
    }
}
