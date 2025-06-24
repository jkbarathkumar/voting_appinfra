variable "resource_group_name" {
  description = "The name of the resource group to create all resources in."
  type        = string
  default     = "rg-aks-active" // Updated default resource group name for active region
}

variable "regions" {
  description = "A map of regions, their locations, and associated network configurations, including AKS details."
  type = map(object({
    location            = string
    vnet_address_space  = list(string)
    public_subnet_cidr  = list(string)
    private_subnet_cidr = list(string)
    aks_cluster_name    = string // Added AKS cluster name per region
    dns_prefix          = string // Added DNS prefix per region
    vm_size             = string // Added VM size per region
  }))
  default = {
    "centralus" = {
      location            = "Central US"
      vnet_address_space  = ["10.0.0.0/16"]
      public_subnet_cidr  = ["10.0.1.0/24"]
      private_subnet_cidr = ["10.0.2.0/24"]
      aks_cluster_name    = "aks-active-cluster"
      dns_prefix          = "aksactive"
      vm_size             = "Standard_A2_v2"
    },
    "westus3" = {
      location            = "West US 3"
      vnet_address_space  = ["10.1.0.0/16"]
      public_subnet_cidr  = ["10.1.1.0/24"]
      private_subnet_cidr = ["10.1.2.0/24"]
      aks_cluster_name    = "aks-passive-cluster"
      dns_prefix          = "akspassive"
      vm_size             = "Standard_D2ds_v6"
    }
  }
}

variable "aks_kubernetes_version" {
  description = "The Kubernetes version to use for the AKS clusters."
  type        = string
  default     = "1.30.6"
}

variable "aks_node_count" {
  description = "The number of nodes in the AKS node pools for each cluster."
  type        = number
  default     = 1
}
