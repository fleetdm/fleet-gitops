# Fleet GitOps

This is the starter repository for using [Fleet](https://fleetdm.com) with a GitOps workflow.

How to set up your GitOps workflow:

1. Clone this repository.

2. If you do not have a Premium Fleet license, delete the `teams` folder.

3. Make any changes to policies, queries, controls, and more defined in the files.

4. Create your own GitHub repository.

5. Add `FLEET_URL` and `FLEET_API_TOKEN` secrets to your new repository's secrets. Learn how [here](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository). Set `FLEET_URL` to your Fleet instance's URL (ex. https://organization.fleet.com). Set `FLEET_API_TOKEN` to an API token for an API-only user in Fleet. Learn how [here](https://fleetdm.com/docs/using-fleet/fleetctl-cli#create-api-only-user).

6. Push your cloned and modified code to your repo.

7. In GitHub, enable the `Apply latest configuration to Fleet` GitHub Actions workflow, and run workflow manually. Now, when anyone pushes a new commit, the action will run and update Fleet.

For all configuration options, go to [GitOps reference](https://fleetdm.com/docs/using-fleet/gitops) in the Fleet documentation.
