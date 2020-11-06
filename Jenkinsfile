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
    }
}
