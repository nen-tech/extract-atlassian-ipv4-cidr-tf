#----------------------------------------------------------------------------------------------------#
#Using the terraform http resource to get the JSON list of IP Addresses from atlassian ip-range url.
#----------------------------------------------------------------------------------------------------#
data "http" "atlassian_cidr_ranges" {
  url = "https://ip-ranges.atlassian.com/"
  request_headers = {
    "Accept" = "application/json"
  }
}

#----------------------------------------------------------------------------------------------------------------------------------------#
# Using terraform external data resource to run a bash program which uses JQ to filter only ipv4 cidr ranges from the http json response.
# Separated ipv4 cidr range with || for easier readability.
#----------------------------------------------------------------------------------------------------------------------------------------#
data "external" "atlassian_ipv4_cidr_ranges" {
  program = ["bash", "-c", "echo '${data.http.atlassian_cidr_ranges.body}' | jq -r '{ipv4_cidr_only:[.items[]|select(.cidr|contains(\":\")|not).cidr] | join(\" || \")}'"]
}

#------------------------------------------------------------------------------------#
# Output only the required result from the executed terraform external data resource.
#------------------------------------------------------------------------------------#
output "ipv4_cidrs_only" {
  value = data.external.atlassian_ipv4_cidr_ranges.result
}
