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

        stage('Copy to Slave') {
            agent { label 'slave-1' }
            steps {
                sh '''
                scp /mnt/project/project/target/LoginWebApp.war \
                root@172.31.40.110:/mnt/servers/apache-tomcat-10.1.52/webapps
                '''
            }
        }
    }
}
