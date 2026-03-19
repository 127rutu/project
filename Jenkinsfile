pipeline {
    agent {
        label "slave-1"
    }

    stages {
        stage('one') {
            steps {
                sh "mvn clean package"
            }
        }

        stage('Two') {
            steps {
                sh '''
                cp target/*.war /mnt/servers/apache-tomcat-10.1.52/webapps/
               '''
            }
        }
    }
}}
