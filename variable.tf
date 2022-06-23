variable "location" {
  type    = string
  default = "West Europe"
}

variable "rgname" {
  type    = string
  default = "appservicesolution"
}

variable "logaltycswsname" {
    type = string
    default = "workspace"
  
}

variable "logaltycswssku" {
    type = string
    default = "PerGB2018"
  
}

variable "envname" {
    type = string
    default = "dev1"
  
}

variable "appserviceplanskutier" {
  type = string
  default = "Standard"
}

variable "appserviceplanskusize" {
  type = string
  default = "S1"
}

variable "dotnetfmversion" {
    type = string
    default = "v4.0"
}

variable "scmtype" {
    type = string
    default = "LocalGit"
  
}

variable "asconnectionname" {
    type = string
    default = "DefaultConnectionString"
  
}

variable "asconnectioncontent" {
    type = string
    sensitive = true
    description = "As the value contains DB credentails it should be defined separately in .tvfars or with any other trusted method"

  
}

variable "asconnectiontype" {
    type = string
    default = "SQLAzure"
  
}

variable "logalwsretentiondays" {
    type = number
    default = 30

  
}

variable "appinsights" {
  type = string
  default = "insights"
}

variable "appinsightsapptype" {
    type = string
    default = "web"
  
}