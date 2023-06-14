Description :
A static content page deployed and served the request via Application Load
Balancers . 

Jenkins pipeline to deploy the same.

Tech stack used : GitHub/Jenkins/Terraform

Cloud Provider : AWS 

Ensuring files ignored through gitignore like  
        - terraform.tfvars
          **/.terraform/*
          *.tfstate
          *.tfstate.*

