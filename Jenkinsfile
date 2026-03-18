pipeline {
    agent any
    stages {

        stage("one") {
            steps {
                sh "mvn clean install"
            }
        }

        stage("two") {
            steps {
                sh '''
                DATE=$(date +%Y-%m-%d)
                TIME=$(date +%H-%M-%S)
                TIMESTAMP=${DATE}_${TIME}
                aws s3 mb s3://pipeline-5
                aws s3 cp /mnt/project/target/LoginWebApp.war s3://pipeline-5/LoginWebApp_${TIMESTAMP}.war
                aws s3api get-object --bucket pipeline-5 --key LoginWebApp_${TIMESTAMP}.war /mnt/servers/apache-tomcat-10.1.52/webapps/LoginWebApp_${TIMESTAMP}.war
                '''
            }
        }

    }
}
