terraform{
    backend "remote" {
      hostname = "app.terraform.io"
      organization = "gabilabs"
    
    
    workspaces{
        name = "aws-gabilabs"
    }
    }
}