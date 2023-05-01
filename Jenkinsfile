pipeline{
    agent any
    parameters {
        choice(name: 'Action', choices: ['Apply', 'Plan', 'Destroy'], description: 'Select the terraform action')
        }
    stages{
        stage("Checkout"){
            steps{
                "checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/amitmaurya0712/Terraform_Jenkins.git']])"
            }
        }

        stage("Initialising the provider"){
           steps{
            sh "terraform init"
           }
        }

        stage("Terraform Actions")
          steps{
            sh "terraform ${Action} --auto-approve"
          }   
    }
}
