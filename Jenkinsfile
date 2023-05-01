pipeline{
    agent any
    parameters {
        booleanParam(name: 'plan', defaultValue: true, description: 'Whether to run a Terraform plan')
        choice(name: 'Action', choices: ['apply', 'destroy'], description: 'Select the terraform action')
        string(name: 'environment', defaultValue: 'default', description: 'Workspace/environment file to use for deployment')
        // string(name: 'version', defaultValue: '', description: 'Version variable to pass to Terraform')
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
               expression { params.plan }
            }
           steps{
            sh "terraform init"
            sh "terraform plan -input=false -out tfplan "
           }
        }

        stage("Terraform Actions"){
        when {
           expression { !params.plan }
          }
          steps{
            sh "(terraform ${params.Action} --auto-approve)"
          }
        }   
    }
}
