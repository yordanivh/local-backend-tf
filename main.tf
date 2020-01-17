resource "null_resource" "helloWorld" {
    triggers = {
        uuid = uuid()
        }
    
    provisioner "local-exec" {
        command = "echo hello test world"
    }
}
