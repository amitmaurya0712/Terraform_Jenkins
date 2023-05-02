pipeline{
    agent any
    parameters {
        booleanParam(name: 'init', defaultValue: true, description: 'Whether to run a Terraform init')
        booleanParam(name: 'plan', defaultValue: true, description: 'Whether to run a Terraform plan')
        booleanParam(name: 'apply', defaultValue: true, description: 'Whether to apply the Terraform configuration')
        booleanParam(name: 'destroy', defaultValue: true, description: 'Whether to destroy the Terraform configuration')
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages{
        stage("Checkout"){
            steps{
                git branch: 'main', url: 'https://github.com/amitmaurya0712/Terraform_Jenkins.git'
            }
        }

        stage("Terraform Init") {
            when {
                expression { params.init }
            }
            steps{
                script{
                    sh "terraform init"
                }
            }
            post {
                always {
                    echo "Terraform Init stage finished."
                }
            }
        }

        stage("Terraform Plan") {
            when {
                expression { params.plan }
            }
            steps{
                script{
                    sh "terraform plan -input=false -out tfplan"
                }
            }
            post {
                always {
                    echo "Terraform Plan stage finished."
                }
            }
        }

        stage("Terraform Apply") {
            when {
                expression { params.apply }
            }
            steps{
                script {
                    if (params.plan) {
                        sh "terraform apply -input=false -auto-approve tfplan"
                    } else {
                        sh "terraform apply -input=false -auto-approve"
                    }
                }
            }
            post {
                always {
                    echo "Terraform Apply stage finished."
                }
            }
        }

        stage("Terraform Destroy") {
            when {
                expression { params.destroy }
            }
            steps{
                script {
                    sh "terraform destroy -input=false -auto-approve"
                }
            }
            post {
                always {
                    echo "Terraform Destroy stage finished."
                }
            }
        }
    }
}
