terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

variable "subscription_id" {
  type = string
}

variable "policy_name" {
  type = string
}

variable "location" {
  type = string
}

resource "azurerm_policy_assignment" "policy" {
  name                 = var.policy_name
  scope                = "/subscriptions/${var.subscription_id}"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/${var.policy_name}"
  location             = var.location
}
