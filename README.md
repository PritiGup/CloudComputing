# CloudComputing

uncomment S3 busket creation code in main.tf to create s3 bucket for saving state.

execute below commonds to create EC2 instance and S3 using variables.
      terraform init
      terraform plan
      terraform apply -var="instance_name=lab4EC2Priti"

delete state file from local directory.
 set S3 bucket policy to 
 {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::lab4-state-terraform"
        },
        {
            "Sid": "Statement2",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::lab4-state-terraform/*"
        }
    ]
} 

comment s3 bukect creation section in main.tf and run again. 

terminated existing EC2 instance and did few experiments. 

**Result** - terraform is referring state from S3 bucket and taking action accordingly. Later terraform updating state file on s3 bucket.
 

