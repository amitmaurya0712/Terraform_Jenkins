pipeline{
    agent any
    parameters {
        choice(name: 'Action', choices: ['apply', 'destroy'], description: 'Select the terraform action')
        string(name: 'environment', defaultValue: 'default', description: 'Workspace/environment file to use for deployment')
        string(name: 'version', defaultValue: '', description: 'Version variable to pass to Terraform')
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
            sh "terraform plan -input=false -out tfplan -var 'version=${params.version}'"
           }
        }

        stage("Terraform Actions"){
          steps{
            sh "(terraform ${params.Action} --auto-approve)"
          }
        }   
    }
}
