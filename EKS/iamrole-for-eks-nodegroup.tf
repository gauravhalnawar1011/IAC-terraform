# IAM Role for EKS Node Group 
resource "aws_iam_role" "eks_nodegroup_role" {
  name = "my-ekscluster-eks-nodegroup-role"

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

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_nodegroup_role.name
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_nodegroup_role.name
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_nodegroup_role.name
}

# Autoscaling Full Access
resource "aws_iam_role_policy_attachment" "eks-Autoscaling-Full-Access" {
  policy_arn = "arn:aws:iam::aws:policy/AutoScalingFullAccess"
  role       = aws_iam_role.eks_nodegroup_role.name
}

# NON PROD Access Custom
resource "aws_iam_role_policy_attachment" "non_prod_custom_role_dynamo" {
  policy_arn = "arn:aws:iam::779111554137:policy/DynamoDB-NonProd-Policy"
  role       = aws_iam_role.eks_nodegroup_role.name
}


resource "aws_iam_role_policy_attachment" "non_prod_custom_role_kms" {
  policy_arn = "arn:aws:iam::779111554137:policy/KMS_GENERATE_DATA_KEY"
  role       = aws_iam_role.eks_nodegroup_role.name
}

resource "aws_iam_role_policy_attachment" "non_prod_custom_role_s3" {
  policy_arn = "arn:aws:iam::779111554137:policy/S3_NON_PROD_POLICY"
  role       = aws_iam_role.eks_nodegroup_role.name
}

resource "aws_iam_role_policy_attachment" "non_prod_custom_role_secret_manager" {
  policy_arn = "arn:aws:iam::779111554137:policy/SecretManager-NonProd"
  role       = aws_iam_role.eks_nodegroup_role.name
}

resource "aws_iam_role_policy_attachment" "sns_push_notifications" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
  role       = aws_iam_role.eks_nodegroup_role.name
}

resource "aws_iam_role_policy_attachment" "non_prodeks_custom_policy" {
  policy_arn = "arn:aws:iam::779111554137:policy/NonProdEKS-Policy"
  role       = aws_iam_role.eks_nodegroup_role.name
}



