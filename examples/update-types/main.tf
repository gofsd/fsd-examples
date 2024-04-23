resource "null_resource" "cluster" {
  triggers = {
    tag = "v0.0.2-dev+64"
  }


  provisioner "local-exec" {
    command = "cd ../../../fsd-types && git add . && git commit -am \"upd\" && git push origin main && git tag ${self.triggers.tag} && git push origin ${self.triggers.tag} && cd ../fsd && go get -u github.com/gofsd/fsd-types@${self.triggers.tag} && go mod tidy && go mod vendor && cd ../terraform-provider-fsd && go get -u github.com/gofsd/fsd-types@${self.triggers.tag} && go mod tidy && go mod vendor"
  }
}