# Create AWS EKS Node Group - Public
resource "aws_eks_node_group" "eks_ng_public" {
  cluster_name    = aws_eks_cluster.eks_cluster.name

  node_group_name = "nonprod"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = data.terraform_remote_state.vpc.outputs.public_subnets
  #version = var.cluster_version #(Optional: Defaults to EKS Cluster Kubernetes version)    
  
  ami_type = "AL2_x86_64"  
  capacity_type = "SPOT"
  disk_size = 20
  version = "1.29"
  instance_types = ["t3a.medium","t3.medium","t2.medium"]
  
  
  remote_access {
    ec2_ssh_key = "equip9-dev"
  }

  scaling_config {
    desired_size = 2
    min_size     = 1    
    max_size     = 5
  }

  # Desired max percentage of unavailable worker nodes during node group update.
  update_config {
    max_unavailable = 1    
    #max_unavailable_percentage = 50    # ANY ONE TO USE
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ] 

    tags = {
    Name = "Public-Node-Group"
    # Cluster Autoscaler Tags
    "k8s.io/cluster-autoscaler/for-dev" = "owned"
    "k8s.io/cluster-autoscaler/enabled" = "TRUE"	
  }
}
