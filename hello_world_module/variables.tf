# Module hello_world - Variables

variable "bucket_name_prefix" {
  description = "Préfixe pour le nom du bucket S3"
  type        = string
  default     = "hello-world"
}

variable "environment" {
  description = "Environnement de déploiement (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags à appliquer aux ressources créées"
  type        = map(string)
  default     = {}
}
