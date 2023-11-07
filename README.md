# Oracle Cloud Terraform
Infrastructure as code setup to manage resources on Oracle Cloud

> https://www.oracle.com/cloud/free/

## Modules
* Compute
* Network
  * Network Security Groups(nsg)
  * Virtual Cloud Network(vcn)

## Run
```bash
$ git clone git@github.com:veerendra2/oracle-cloud-terraform.git
$ cd oracle-cloud-terraform/environments/frankfurt/

# terraform http backend username and password
$ export TF_HTTP_USERNAME=[REDACTED]
$ export TF_HTTP_PASSWORD=[REDACTED]

# oci authentication key file location
$ export TF_VAR_private_key_path=./auth-key.pem

$ terraform plan -out=plan

$ terraform apply "plan"
```
## Refereces

#### OCI
* [Oracle Cloud Infrastructure Free Tier](https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier.htm)
* [API Key Authentication](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformproviderconfiguration.htm#APIKeyAuth)
* [Terraform: Set Up OCI Terraform](https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-provider/01-summary.htm)
* [Regions and Availability Domains](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm)
* [Network Security Groups](https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/networksecuritygroups.htm)

#### Terraform
* [OCI Compute Example](https://github.com/oracle-terraform-modules/terraform-oci-compute-instance.git)
* [Always Free Example](https://github.com/oracle/terraform-provider-oci/tree/master/examples/always_free)
