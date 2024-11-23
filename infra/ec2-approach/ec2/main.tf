resource "aws_instance" "flask_app" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]

iam_instance_profile = var.iam_instance_profile

  

  user_data = <<-EOF
    #!/bin/bash
    echo "export BUCKET_NAME=${var.bucket_name}" >> /etc/environment
    apt update -y
    apt install -y python3 python3-pip git
    pip3 install flask boto3

    # Clone your GitHub repo
    git clone https://github.com/pranavlonsane777/assignment.git /home/pranavlonsane/assignment/

    # Navigate to app directory and run the Flask app
    cd /home/pranavlonsane/assignment/app/ec2-approach
    FLASK_APP=app.py nohup flask run --host=0.0.0.0 --port=5000 &
  EOF

  tags = {
    Name = "Flask-App-Instance"
  }
}
