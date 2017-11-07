#!/usr/bin/env bash
set -e
# Provisions a virtual machine instance

# Export input variables in the bash environment
export TF_VAR_name="$(awk -v var="$PORTAL_DEPLOYMENT_REFERENCE" 'BEGIN {print tolower(var)}')"
export KEY_PATH="${HOME}/.ssh/demo-key.pem"

# Start local ssh-agent
eval "$(ssh-agent -s)"
ssh-add $KEY_PATH &> /dev/null

#Launch provisioning of the VM
terraform apply --state=$PORTAL_DEPLOYMENTS_ROOT'/'$PORTAL_DEPLOYMENT_REFERENCE'/terraform.tfstate' $PORTAL_APP_REPO_FOLDER'/ostack/terraform'

# Kill local ssh-agent
eval "$(ssh-agent -k)"
