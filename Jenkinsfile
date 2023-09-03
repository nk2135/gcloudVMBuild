pipeline {
    agent any

    environment {
        GOOGLE_CREDENTIALS = credentials('gcloud')  // Jenkins credential ID for GCP
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Setup GCP Auth') {
            steps {
                script {
                    bat 'echo %GOOGLE_CREDENTIALS% > smooth-league-275317-eafc1a750e38.json'
                    bat 'set GOOGLE_APPLICATION_CREDENTIALS=%WORKSPACE%\\smooth-league-275317-eafc1a750e38.json'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                bat 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'terraform plan -out=tfplan -no-color'
		

            }
        }

        // Add this new stage for manual review
        stage('Review Plan') {
            steps {
                input(message: 'Review the Terraform plan. Proceed to apply?', ok: 'Proceed')
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            bat 'del smooth-league-275317-eafc1a750e38.json'
        }
    }
}
