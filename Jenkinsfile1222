pipeline{
    agent any
    parameters {
        booleanParam(name: 'init', defaultValue: true, description: 'Whether to run a Terraform plan')
        booleanParam(name: 'plan', defaultValue: true, description: 'Whether to run a Terraform plan')
        booleanParam(name: 'apply', defaultValue: true, description: 'Whether to apply or destroy the Terraform configuration')
        booleanParam(name: 'destroy', defaultValue: true, description: 'Whether to apply or destroy the Terraform configuration')
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

        stage("Initialising the provider"){
            when {
                expression { params.init || params.plan }
            }
            steps{
                script{
                    if (params.init) {
                        sh "terraform init"
                        echo "Terraform init completed."
                    } else if (params.plan){
                        sh "terraform plan -input=false -out tfplan "
                        echo "Terraform plan completed."
                    } else {
                        echo "Initialising the provider stage skipped."
                    }
                }
            } 
        }

        stage('Terraform Apply') {
            when {
                expression { params.apply || params.destroy }
            }    
            steps {
                script {
                    if (params.apply) {
                        sh "terraform apply -input=false -auto-approve"
                        echo "Terraform apply completed."
                    } else if (params.destroy) {
                        sh "terraform destroy -input=false -auto-approve"
                        echo "Terraform destroy completed." 
                    } else {
                        echo "Terraform Apply stage skipped."
                    }
                }
            }
        }
    }  
}
