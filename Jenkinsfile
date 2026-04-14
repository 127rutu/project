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

        stage('Setup Database') {
            steps {
                sh '''
                    chmod -R 777 database.sh
                    ./database.sh
                '''
            }
        }

        stage('Deploy to Slave') {
            agent { label 'slave-1' }

            steps {
                sh '''
                    scp ${WORKSPACE}/target/LoginWebApp.war \
                    root@172.31.35.143:/mnt/servers/apache-tomcat-10.1.52/webapps
                '''
            }
        }
    }
}
