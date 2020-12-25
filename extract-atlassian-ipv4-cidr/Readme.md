## Providers

| Name | Version |
|------|---------|
| external |  v2.0.0 |
| http |  v2.0.0 |

## Inputs

No inputs required for executing.

## Outputs

| Name | Description |
|------|-------------|
| ipv4\_cidrs\_only |  Outputs atlassian ipv4 cidrs which has been filtered out from the atlassian ip-ranges url. only the required result from the executed terraform external data resource is displayed.|

## How To Run

| Dependencies | Version |
|------|---------|
| Terraform | v0.14.3  |
| jq |  v1.6 |

```commandline
terraform init
terraform apply
```

## Example Result

```commandline
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

ipv4_cidrs_only = tomap({
  "ipv4_cidr_only" = "52.41.219.63/32 || 34.216.18.129/32 || 13.236.8.128/25 || 18.246.31.128/25 || 34.236.25.177/32 || 185.166.140.0/22 || 34.199.54.113/32 || 35.155.178.254/32 || 52.204.96.37/32 || 35.160.177.10/32 || 52.203.14.55/32 || 18.184.99.128/25 || 52.215.192.128/25 || 104.192.136.0/21 || 18.205.93.0/27 || 35.171.175.212/32 || 18.136.214.0/25 || 52.202.195.162/32 || 13.52.5.0/25 || 34.218.168.212/32 || 18.234.32.128/25 || 34.218.156.209/32 || 52.54.90.98/32 || 34.232.119.183/32 || 34.232.25.90/32"
})

```





