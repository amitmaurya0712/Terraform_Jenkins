pipeline{
    agent any
    parameters {
        booleanParam(name: 'init', defaultValue: true, description: 'Whether to run a Terraform plan')
        booleanParam(name: 'plan', defaultValue: true, description: 'Whether to run a Terraform plan')
        booleanParam(name: 'apply', defaultValue: true, description: 'Whether to apply or destroy the Terraform configuration')
        booleanParam(name: 'destroy', defaultValue: true, description: 'Whether to apply or destroy the Terraform configuration')
        // choice(name: 'Action', choices: ['apply', 'destroy'], description: 'Select the terraform action')
        // string(name: 'environment', defaultValue: 'default', description: 'Workspace/environment file to use for deployment')
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
               expression { params.init ||params.plan }
            }
           steps{
            if (params.init){
            sh "terraform init"
            } else if (params.plan){
            sh "terraform plan -input=false -out tfplan "
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
              } else if (params.destroy) {
                sh "terraform destroy -input=false -auto-approve"
              }
            }
          }
        }
      }
    }  
