pipeline{
    agent any
    parameters {
        booleanParam(name: 'plan', defaultValue: true, description: 'Whether to run a Terraform plan')
        booleanParam(name: 'apply', defaultValue: true, description: 'Select the terraform action')
        booleanParam(name: 'destroy', defaultValue: true, description: 'Select the terraform action')
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

        stage("Terraform Apply"){
        when {
           expression { !params.plan }
        }
          steps{
            sh "(terraform ${params.apply} --auto-approve)"
          }
        } 

        stage("Terraform Destroy"){
        when {
           expression { !params.plan }
        }
          steps{
            sh "(terraform ${params.destroy} --auto-approve)"
          }
        }   
    }
}
