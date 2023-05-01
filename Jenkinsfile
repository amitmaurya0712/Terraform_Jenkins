pipeline{
    agent any
    parameters {
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

        stage("Terraform Actions"){
          steps{
            sh "(terraform ${Action} --auto-approve)"
          }
        }   
    }
}
