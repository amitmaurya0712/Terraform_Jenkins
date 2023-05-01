pipeline{
    agent any
    parameters {
        boolean(name: 'Plan', choices: ['apply', 'plan', 'destroy'], description: 'Select the terraform action')
        choice(name: 'Action', choices: ['apply', 'plan', 'destroy'], description: 'Select the terraform action')
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
           steps{
            sh "terraform init"
           }
        }

        stage("Plan"){
            steps{
                sh "terraform plan"
            }
        }

        stage("Terraform Actions"){
          steps{
            sh "(terraform ${params.Action} --auto-approve)"
          }
        }   
    }
}
