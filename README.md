# Oracle Cloud Terraform
Infrastructure as code setup to manage resources on Oracle Cloud

> https://www.oracle.com/cloud/free/

## Run
```bash
$ git clone git@github.com:veerendra2/oracle-cloud-terraform.git
$ cd oracle-cloud-terraform/environments/frankfurt/

$ terraform plan -out=plan

$ terraform apply "plan"
```

## TF_VARs
`export` below TF_VARs if not added in [providers.tf](./environments/frankfurt/providers.tf)
```bash
export TF_VAR_compartment_ocid=[REDACTED]
export TF_VAR_fingerprint=[REDACTED]
export TF_VAR_private_key_path=[REDACTED]
export TF_VAR_region=[REDACTED]
export TF_VAR_tenancy_ocid=[REDACTED]
export TF_VAR_user_ocid=[REDACTED]
```

## Refereces

#### OCI
* [Oracle Cloud Infrastructure Free Tier](https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier.htm)
* [API Key Authentication](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformproviderconfiguration.htm#APIKeyAuth)
* [Terraform: Set Up OCI Terraform](https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-provider/01-summary.htm)

#### Terraform
* [OCI Compute Example](https://github.com/oracle-terraform-modules/terraform-oci-compute-instance.git)
* [Always Free Example](https://github.com/oracle/terraform-provider-oci/tree/master/examples/always_free)
