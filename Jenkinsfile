pipeline {
    agent any
    tools{
        //Below tool name pre-configured in Jenkins under Manage Jenkins → Tools
        terraform 'jenkins-terraform'
    }
    parameters {
        choice(name: 'TERRAFORM_ACTIONS',choice: ['plan','apply','destroy'],description: 'slect desired terra operation command' )
    }
    // pipeline statges & corresponding steps
    stages {
        stage('GitCheckout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mydevopscoach/my-tf-iac-aws-repo']]])            
          }
        }
        
        stage ("terraform init") {
            steps {
                sh ('terraform init') 
            } 
        }
        
        stage ("terraform Action") {
            steps {
                echo "Terraform action is --> ${params.TERRAFORM_ACTIONS}"
                sh ('terraform ${params.TERRAFORM_ACTIONS} --auto-approve') 
           }
        }
    }
    // post-build actions
    post{
       success{
          echo "terraform ${TerraformAction} action successfully over"
        }
       failure{
          echo "terraform ${TerraformAction} action FIALED check the required Pipeline conf or tf files"
        }
    }
}