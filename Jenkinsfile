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

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: '**/target/LoginWebApp.war', fingerprint: true
            }
        }

        stage('Deploy to Slave-1') {
            agent { label 'slave-1' }

            steps {
                copyArtifacts(
                    projectName: env.JOB_NAME,
                    selector: lastSuccessful(),
                    filter: 'target/LoginWebApp.war'
                )

                sh '''
                    cp target/LoginWebApp.war /mnt/servers/apache-tomcat-10.1.52/webapps/
                '''
            }
        }
    }
}
