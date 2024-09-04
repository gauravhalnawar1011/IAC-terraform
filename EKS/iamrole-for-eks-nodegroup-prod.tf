# IAM Role for EKS Node Group 
resource "aws_iam_role" "eks_nodegroup_role-prod" {
  name = "my-ekscluster-eks-nodegroup-prod-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSWorkerNodePolicy-prod" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_nodegroup_role-prod.name
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKS_CNI_Policy-prod" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_nodegroup_role-prod.name
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEC2ContainerRegistryReadOnly-prod" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_nodegroup_role-prod.name
}

# Autoscaling Full Access
resource "aws_iam_role_policy_attachment" "eks-Autoscaling-Full-Access-prod" {
  policy_arn = "arn:aws:iam::aws:policy/AutoScalingFullAccess"
  role       = aws_iam_role.eks_nodegroup_role-prod.name
}

# PROD Access Custom
resource "aws_iam_role_policy_attachment" "prod_custom_role_dynamo" {
  policy_arn = "arn:aws:iam::<Accountid>:policy/DynamoDb-Prod-Policy"
  role       = aws_iam_role.eks_nodegroup_role-prod.name
}


resource "aws_iam_role_policy_attachment" "prod_custom_role_kms" {
  policy_arn = "arn:aws:iam::779111554137:policy/KMS_GENERATE_DATA_KEY"
  role       = aws_iam_role.eks_nodegroup_role-prod.name
}

resource "aws_iam_role_policy_attachment" "prod_custom_role_s3" {
  policy_arn = "arn:aws:iam::779111554137:policy/S3ProdAccess"
  role       = aws_iam_role.eks_nodegroup_role-prod.name
}

resource "aws_iam_role_policy_attachment" "prod_custom_role_secret_manager" {
  policy_arn = "arn:aws:iam::779111554137:policy/PROD_SECRET_MANAGER"
  role       = aws_iam_role.eks_nodegroup_role-prod.name
}



