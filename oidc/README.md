# oidc

Here lies the OIDC configs. They are intended to be run on a workstation, because you can only automate so much.

## Why OIDC?

You won't need stored static AWS repo secrets anymore.

## What is OIDC, and how does this help me do it?

OIDC is a method of gaining authentication and authorization to a service via JSON Web Tokens (JWT), without storing any secrets at rest. Github has an OIDC identity provider, and it can communicate with any other OIDC provider. Instructions exist for using AWS, Azure, Google Cloud, and Hashicorp Vault. No extra configuration is required on the Github end. 

Contained herein are terraform resources for creating an OIDC provider in AWS with the express purpose of using an S3 bucket for terraform state storage.

Automation came from AWS manual steps for [creating OIDC identity providers](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc.html#manage-oidc-provider-console) via the console. Github specific configuration of the OIDC IdP comes from docs concerning [adding the identity provider to AWS](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services#adding-the-identity-provider-to-aws)

## What about configuring Actions?

Look in .github/workflows for the breakdown of what to do.

The [AWS Credentials Action](https://github.com/marketplace/actions/configure-aws-credentials-action-for-github-actions#overview) is necessary to pass transmit the JWT to AWS and properly disseminate the temporary credentials inside the action. Note the `permissions` section of the workflow; more info can be found [here](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services#adding-permissions-settings).