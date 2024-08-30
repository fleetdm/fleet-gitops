# Fleet GitOps

This is the starter repository for using [Fleet](https://fleetdm.com) with a GitOps workflow.

How to set up your GitOps workflow:

1. Clone this repository.

2. If you do not have a Premium Fleet license, delete the `teams` folder.

3. Make any changes to policies, queries, controls, and more defined in the files.

4. [Set up on GitHub](#set-up-on-github) or [set up on GitLab](#set-up-on-gitlab).

## Set up on GitHub

1. Create your own GitHub repository.

2. Add `FLEET_URL` and `FLEET_API_TOKEN` secrets to your new repository's secrets. Learn how [here](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository). Set `FLEET_URL` to your Fleet instance's URL (ex. https://organization.fleet.com). Set `FLEET_API_TOKEN` to an API token for an API-only user in Fleet. Learn how [here](https://fleetdm.com/docs/using-fleet/fleetctl-cli#create-api-only-user).

3. Add `FLEET_GLOBAL_ENROLL_SECRET` secret to your new repository's secrets. The enroll secret must be an alphanumeric string of at least 32 and at most 255 characters.
   - If you have a Premium Fleet license, also add `FLEET_WORKSTATIONS_ENROLL_SECRET` and `FLEET_WORKSTATIONS_CANARY_ENROLL_SECRET`.

4. Delete `.gitlab-ci.yml`, which is for GitLab CI/CD.

5. Push your cloned and modified code to your repo.

6. In GitHub, enable the `Apply latest configuration to Fleet` GitHub Actions workflow, and run workflow manually. Now, when anyone pushes a new commit to the default branch, the action will run and update Fleet. For pull requests, the workflow will do a dry run only.

## Set up on GitLab

1. Create your own GitLab repository.

2. Add `FLEET_URL` and `FLEET_API_TOKEN` as masked CI/CD variables. Learn how [here](https://docs.gitlab.com/ee/ci/variables/#define-a-cicd-variable-in-the-ui). Set `FLEET_URL` to your Fleet instance's URL (ex. https://organization.fleet.com). Set `FLEET_API_TOKEN` to an API token for an API-only user in Fleet. Learn how [here](https://fleetdm.com/docs/using-fleet/fleetctl-cli#create-api-only-user).

3. Add `FLEET_GLOBAL_ENROLL_SECRET` secret as a masked CI/CD variable. The enroll secret must be an alphanumeric string of at least 32 and at most 255 characters.
    - If you have a Premium Fleet license, also add `FLEET_WORKSTATIONS_ENROLL_SECRET` and `FLEET_WORKSTATIONS_CANARY_ENROLL_SECRET`.

4. Delete `.github` folder, which is for GitHub Actions.

5. Push your cloned and modified code to your repo.

6. Now, when anyone pushes a new commit to the default branch, the pipeline will run and update Fleet. For merge requests, the pipeline will do a dry run only.

## Configuration options

For all configuration options, go to [GitOps reference](https://fleetdm.com/docs/using-fleet/gitops) in the Fleet documentation.
