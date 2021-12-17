## About

[![IaC](https://app.soluble.cloud/api/v1/public/badges/12019c76-9c5a-4efc-aa63-d79cb8d13c71.svg)](https://app.soluble.cloud/repos/details/github.com/james-leha/demo-lw-iac-container-scanning)  [![CIS](https://app.soluble.cloud/api/v1/public/badges/e6b18e74-e04a-4b17-9143-221934469ab0.svg)](https://app.soluble.cloud/repos/details/github.com/james-leha/demo-lw-iac-container-scanning)  
An internal repo to demo Lacework CI workflow implementations leveraging:
- [The Lacework Inline Scanner](https://docs.lacework.com/integrate-the-lacework-inline-scanner-with-ci-pipelines) in a GitHub Action workflow
- [Soluble IaC Analysis](https://docs.lacework.com/infrastructure-as-code-security-analysis) with GitHub repository
- Lacework Policy Evaluator in CI Piplines (alpha/beta)
  - See [Tech Talk on Our DevSecOps story (11/05/21)](https://lacework.atlassian.net/wiki/spaces/ENG/pages/2312110131/Tech+Talks#%5Bdate%5D---Shifting-Security-Left---Our-DevSecOps-Story-by-%40Chitra-Kumar-%40Divyang-Soni)
  - The feature flag needs to be enabled for your LW Instance, reach out to @Nolan Karpinski - see this [Slack thread](https://lacework.slack.com/archives/C01EN2YLSGN/p1639157060003100?thread_ts=1639093761.466500&cid=C01EN2YLSGN)

# Voting App

This sample creates a multi-container application. The application interface has been built using Python / Flask. The data component is using Redis.

To walk through a quick deployment of this application, see the Microsoft Tutorial [doc](https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-prepare-app).

## Run locally

### Run kubectl
1. View services
- kubectl svc
2. Apply yaml files
- kubectl apply -f .
3. Expose port for local host: 
- kubectl port-forward voting-service-front-74c6d68576-5vvwm 8080:80  

## Prerequisites

1. The Policy Evaluateor in this demo requires 2 secrets to be generated:

| Secret Name | Value Required |
|-------------      |--------------- |
|LW_ACCESS_TOKEN                     | Access token from a Container Registry integration for the `Inline Scanner` |
|LW_ACCOUNT_NAME                     | LW Instance rule where Access Token and Policies are defined from |

2. Configure Container Policies within the Lacework Platform for *Action on Failure*: `Block` 

## How to Demo
1. Open project in Codespaces or VS Code
2. Use `docker-compose build` and `docker-compose up` commands to show off the application
3. Create a new branch, 
    - modify `voting-service/voting-service/config_file.cfg` to update homepage values
    - modify IaC to introduce violations in folders `terraform` , `manifests` , or `CloudFormation`
1. Create a PR, utilize review-lab keyword comment - if desired.
1. Merge PR, observe that **Cleanup PR** and **AKS Staging & Production - Deploy** workflows kick off
1. View Staging and Production environment deployments


# Troubleshooting / Limitations

## Manifest File
Currently the `manifests/deployment.yml` file needs to have the `voting-service-front` **image** value updated to match your repository.

# References

## Soluble
Internal Soluble SE Training Session by @Rob Schoening 
Please find below the recording to the session:
- https://lacework.zoom.us/rec/share/qr0upLU1va6oF-59eaclybvS5N22KTRojq8o-WzZ5GnsNj7mQk-7wMGE2zsmOgrM.F59_3f6U7PPMG3AR 
- Passcode: ?^&Z?96o
