# Fleet GitOps

This folder illustrates the best practice for using Fleet with a GitOps workflow.

How to setup a GitOps workflow to manage Fleet:

1. Clone this repository.

2. Make any changes to policies, queries, controls, and more defined in the files.

3. Create your own GitHub repository and push your cloned and modified code to your repo.

4. Add Fleet's open-source [GitHub action](https://github.com/fleetdm/fleet-gitops) to your repo. Now, when anyone makes a change to any file, the action will run and update Fleet.

#### Structure:

- `lib/` - folder for policies, queries, configuration profiles, scripts, and agent options. These files can be referenced in top level keys in the `default.yml` file and the files in the `teams/` folder.
- `default.yml` - file that defines the queries, policies, controls, and agent options for all hosts. If you're using Fleet Premium, this file updates queries and policies that run on all hosts ("All teams"). Controls and agent options are defined for hosts on "No team."
- `teams/` - folder for teams in Fleet. These files define the controls, queries, policies, and agent options for hosts assigned to the specified team.
- `.github/workflows/workflow.yml` - TODO: Explain how to add/update secrets. That's what this file is used for
