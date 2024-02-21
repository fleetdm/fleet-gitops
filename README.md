# Fleet GitOps

> #### 🚧 Fleet GitOps is currently in beta.
>
> In Fleet 4.45, Fleet GitOps was released in beta. The Fleet team is currently [dogfooding](https://en.wikipedia.org/wiki/Eating_your_own_dog_food) and documenting the feature. You can track the progress [here](https://github.com/fleetdm/fleet/issues/17043).

This folder illustrates the best practice for using Fleet with a GitOps workflow.

How to set up a GitOps workflow to manage Fleet:

1. Clone this repository.

2. If you do not have a Premium Fleet license, delete the `teams` folder.

3. Make any changes to policies, queries, controls, and more defined in the files.

4. Create your own GitHub repository.

5. Add `FLEET_URL` and `FLEET_API_TOKEN` to your GitHub repository secrets.

6. Update the `env` section of your [.github/workflows/workflow.yml](https://github.com/fleetdm/fleet-gitops/blob/main/.github/workflows/workflow.yml) file for all the environment variables that are mentioned in your `default.yml` and `teams/*.yml` YAML files. For the environment variables that map to secrets, add the required secrets to your GitHub repository secrets.

7. Push your cloned and modified code to your repo.

8. In GitHub, enable the `Apply latest configuration to Fleet` GitHub Actions workflow, and run workflow manually. Now, when anyone pushes a new commit, the action will run and update Fleet.

#### Structure:

- `lib/` - folder for policies, queries, configuration profiles, scripts, and agent options. These files can be referenced in top level keys in the `default.yml` file and the files in the `teams/` folder.
- `default.yml` - file that defines the queries, policies, controls, and agent options for all hosts. If you're using Fleet Premium, this file updates queries and policies that run on all hosts ("All teams"). Controls and agent options are defined for hosts on "No team."
- `teams/` - folder for teams in Fleet. These `*.yml` files define the controls, queries, policies, and agent options for hosts assigned to the specified team.
- `.github/workflows/workflow.yml` - the GitHub workflow file that applies the latest configuration to Fleet.
- `.github/gitops-action/action.yml` - the GitHub action that runs `gitops.sh`. This action is used in the GitHub workflow file. It can also be used in other workflows.
- `gitops.sh` - the bash script that applies the latest configuration to Fleet by executing `fleetctl gitops`. This script is used in the GitHub action file. It can be run standalone during development.
