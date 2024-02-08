# Fleet GitOps

> #### 🚧 Fleet GitOps is currently in development.
>
> In the meantime, you can explore this repo for a preview of Fleet's GitOps best practice, and track its progress [here](https://github.com/fleetdm/fleet/issues/13643).

This folder illustrates the best practice for using Fleet with a GitOps workflow.

How to set up a GitOps workflow to manage Fleet:

1. Clone this repository.

2. Make any changes to policies, queries, controls, and more defined in the files.

3. Create your own GitHub repository.

4. Add `FLEET_URL` and `FLEET_API_KEY` to your GitHub repository secrets.

5. Update the `env` section of your [.github/workflows/workflow.yml](https://github.com/fleetdm/fleet-gitops/blob/main/.github/workflows/workflow.yml) file for all the environment variables that are mentioned in your `default.yml` and `teams/*.yml` YAML files. For the environment variables that map to secrets, add the required secrets to your GitHub repository secrets.

6. Push your cloned and modified code to your repo.

7. In GitHub, enable the `Apply latest configuration to Fleet` GitHub Actions workflow, and run workflow manually. Now, when anyone pushes a new commit, the action will run and update Fleet. In addition, the workflow will run every 24 hours to ensure that the Fleet configuration is in sync with your git repo.

#### Structure:

- `lib/` - folder for policies, queries, configuration profiles, scripts, and agent options. These files can be referenced in top level keys in the `default.yml` file and the files in the `teams/` folder.
- `default.yml` - file that defines the queries, policies, controls, and agent options for all hosts. If you're using Fleet Premium, this file updates queries and policies that run on all hosts ("All teams"). Controls and agent options are defined for hosts on "No team."
- `teams/` - folder for teams in Fleet. These `*.yml` files define the controls, queries, policies, and agent options for hosts assigned to the specified team.
- `.github/workflows/workflow.yml` - the GitHub Actions workflow file that applies the latest configuration to Fleet.
- `workflow.sh` - the bash script that applies the latest configuration to Fleet by executing `fleetctl gitops`. This script is used in the GitHub Actions workflow file. It can be run standalone during development.