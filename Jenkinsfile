pipeline {
    agent any

    stages {
        stage('unit test and report') {
            steps {
                sh label: 'go command', script: '''
                cd store-service
                go mod download
                go test ./cmd/tests -v 2>&1 | go-junit-report > report.xml '''
            }
            post {
                always {
                    junit 'store-service/report.xml'
                }
            }
        }

        stage('build and start application') {

            steps {
                sh label: 'docker-compose', script: 'docker-compose up -d --build --force-recreate'
            }
        }

        stage('run api test') {

            steps {
                sh label: 'robot', script: '''cd test/api
                sleep 5
                robot product-success-template.robot'''
            }

            post {
                always {
                    robot outputPath: 'test/api/', passThreshold: 100.0
                    sh label: '', script: 'docker-compose down'
                }
            }
        }
    }
}
