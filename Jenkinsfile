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

        stage('Upload WAR to S3') {
            steps {
                sh 'aws s3 mb s3://assignment-9b-rutuja'
                sh 'aws s3 cp /mnt/project/project/target/LoginWebApp.war s3://assignment-9b-rutuja/'
            }
        }

        stage('Download from S3 to Slave & Deploy') {
            steps {
                sh 'aws s3 cp s3://assignment-9b-rutuja/LoginWebApp.war /mnt/jenkins-slave/LoginWebApp.war'
                sh 'cp /mnt/jenkins-slave/LoginWebApp.war /mnt/servers/apache-tomcat-10.1.52/webapps/'
            }
        }
    }
}}
