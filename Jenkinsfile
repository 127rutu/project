pipeline {
    agent { label 'built-in' }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/127rutu/project.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh '''
                    /mnt/build-tools/apache-maven-3.9.14/bin/mvn clean install
                '''
            }
        }

        stage('Save Artifacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }

        stage('Setup DB') {
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
                unstash 'war-file' // only if you use stash (optional)

                sh '''
                    scp target/*.war root@172.31.35.143:/mnt/servers/apache-tomcat-10.1.52/webapps
                '''
            }
        }
    }
}
