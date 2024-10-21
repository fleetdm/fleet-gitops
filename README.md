# Fleet GitOps

This is the starter repository for using [Fleet](https://fleetdm.com) with a GitOps workflow.

## Why use Fleet with GitOps

Before getting into [how to set up your GitOps workflow](#how-to-set-up-your-gitops-workflow), here are some good reasons to use Fleet with GitOps:

### Change management
Use CI/CD to streamline and approve changes across security, management, and productivity. With git as the backbone, changes become more reliable and transparent—ensuring consistency, security, and easy tracking, even as things evolve.

### Auditing
Track and audit every change in one system. Know who made changes, when, and why—without being tied to vendor-specific methods. Git commit history records every action, letting you see exactly what changed and who approved it.

### Simplify and secure access
IT admins are prime targets for attacks, yet their tools are often insecure and outdated. Instead of relying on legacy platforms, move to a secure, transparent system: git. With git-based changes, admins can work safely in an already trusted environment. Tools like GitHub or GitLab offer easy-to-use interfaces for those who prefer them.

### Consolidation and reduced learning curve
Rather than relying on multiple teams for tools like Intune or Jamf, build a unified team of OS specialists. By using git for MDM (mobile device management), admins can focus on expertise in macOS, Windows, or Linux—not specific vendor tools. This approach reduces silos, fosters collaboration, and helps teams learn valuable DevOps skills—avoiding reliance on unstable, vendor-specific tools that may raise prices or fade away.

## How to set up your GitOps workflow:

> Calling 'fleetctl gitops' directly is only recommended for experienced users. For documentation, run `fleetctl gitops --help`.

1. Clone this repository.

2. If you do not have a Premium Fleet license, delete the `teams` folder.

3. Make any changes to policies, queries, controls, and more defined in the files.

4. [Set up on GitHub](#set-up-on-github) or [set up on GitLab](#set-up-on-gitlab).

## Set up on GitHub

1. Create your own GitHub repository.

2. Add `FLEET_URL` and `FLEET_API_TOKEN` secrets to your new repository's secrets. Learn how [here](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository). Set `FLEET_URL` to your Fleet instance's URL (ex. https://organization.fleet.com). Set `FLEET_API_TOKEN` to an API token for an API-only user in Fleet. Learn how [here](https://fleetdm.com/docs/using-fleet/fleetctl-cli#create-api-only-user).

3. Add `FLEET_GLOBAL_ENROLL_SECRET` secret to your new repository's secrets. The enroll secret must be an alphanumeric string of at least 32 and at most 255 characters.
   - If you have a Premium Fleet license, also add `FLEET_WORKSTATIONS_ENROLL_SECRET` and `FLEET_WORKSTATIONS_CANARY_ENROLL_SECRET`.
   - If you do not have a Premium Fleet license, uncomment the following line in `.github/workflows/workflow.yml`:
```yaml
          # delete-other-teams: false
```

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
