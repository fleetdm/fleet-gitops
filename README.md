# Fleet GitOps

This is the starter repository for using [Fleet](https://fleetdm.com) with a GitOps workflow.

[Why use GitOps?](https://fleetdm.com/guides/sysadmin-diaries-gitops-a-strategic-advantage#basic-article)

## GitHub setup

1. Clone the [GitHub repository](https://github.com/fleetdm/fleet-gitops), create your own GitHub repository, and push your clone to your new repo. Note that a workflow will run once and fail because the required variables haven't been added (step 2 and 3).

2. Add `FLEET_URL` and `FLEET_API_TOKEN` secrets to your new repository's secrets. Learn how [here](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository). Set `FLEET_URL` to your Fleet instance's URL (ex. https://organization.fleet.com). [Create an API-only user](https://fleetdm.com/docs/using-fleet/fleetctl-cli#create-api-only-user) with the "GitOps" role and set `FLEET_API_TOKEN` to your user's API token. If you're using Fleet Free, set the API-only user's role to global admin.

3. Add `FLEET_GLOBAL_ENROLL_SECRET` secret to your new repository's secrets. The enroll secret must be an alphanumeric string of at least 32 and at most 255 characters.
   - If you have a Premium Fleet license, also add `FLEET_WORKSTATIONS_ENROLL_SECRET` and `FLEET_WORKSTATIONS_CANARY_ENROLL_SECRET`.
   - If you do not have a Premium Fleet license, delete the `teams` directory.

4. In GitHub, enable the `Apply latest configuration to Fleet` GitHub Actions workflow, and run workflow manually. Now, when anyone pushes a new commit to the default branch, the action will run and update Fleet. For pull requests, the workflow will do a dry run only.

## GitLab setup

1. Clone the [GitLab repository](https://gitlab.com/fleetdm/fleet-gitops), create your own GitLab repository, and push your clone to your new repo. Note that a pipeline will run once and fail because the required variables haven't been added (step 2 and 3).

2. Add `FLEET_URL` and `FLEET_API_TOKEN` as masked CI/CD variables. Learn how [here](https://docs.gitlab.com/ee/ci/variables/#define-a-cicd-variable-in-the-ui). Set `FLEET_URL` to your Fleet instance's URL (ex. https://organization.fleet.com). Set `FLEET_API_TOKEN` to an API token for an API-only user in Fleet. Learn how [here](https://fleetdm.com/docs/using-fleet/fleetctl-cli#create-api-only-user), then, grant it the `GitOps` role via the **Settings** > **Users** page so it can make changes.

3. Add `FLEET_GLOBAL_ENROLL_SECRET` secret as a masked CI/CD variable. The enroll secret must be an alphanumeric string of at least 32 and at most 255 characters.
   - If you have a Premium Fleet license, also add `FLEET_WORKSTATIONS_ENROLL_SECRET` and `FLEET_WORKSTATIONS_CANARY_ENROLL_SECRET`.
   - If you do not have a Premium Fleet license, delete the `teams` directory.

4. Now, when anyone pushes a new commit to the default branch, the pipeline will run and update Fleet. For merge requests, the pipeline will do a dry run only.

## Configuration options

For all configuration options, go to the [YAML files reference](https://fleetdm.com/docs/using-fleet/gitops) in the Fleet docs.

## Fleet UI

Once you're set up with GitOps in Fleet, you can optionally put the UI in GitOps mode. This prevents you from making changes in the UI that would be overridden by GitOps workflows. 

An admin can enable GitOps mode in **Settings** > **Integrations** > **Change management**.

Note that this is a UI-only setting. API permissions are restricted based on user role.

