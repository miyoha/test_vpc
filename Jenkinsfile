pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                checkout scm
            }
        }
        stage('Set Env Path') {
            steps {
                script {
                    env.PATH += ":/usr/local/bin/"
                }
                sh 'terraform --version'
            }
        }
        stage('TF Init') {
            steps {
                dir('terraform') {
                    ansiColor('xterm') {
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('TF Plan') {
            steps {
                dir('terraform') {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awsCredentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        ansiColor('xterm') {
                            sh 'terraform validate'
                            sh 'terraform plan -out=tfplan'
                        }
                    }
                }
            }
        }
    }
}
