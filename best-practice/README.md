# Best practice

This folder illustrates the best practice for using Fleet with a GitOps workflow.

Soon, a Fleet user will be able to clone this repository, push up the contents of this `best-practice/` folder to their organization's repository, and add Fleet's open-source [GitHub action](https://github.com/fleetdm/fleet-mdm-gitops) to the repo. When the user makes changes to any file, the action will run and update Fleet.

> The GitHub action is not ready for use with this best practice. The action only supports configuration profiles, disk encryption and OS updates for macOS.

#### Structure:

- `mdm-profiles` - folder for configuration profiles. These profiles are referenced in `no-team.controls.yml` and team level `controls.yml`.
- `scripts` - folder for scripts. These scripts are referenced in `no-team.controls.yml` and team level `controls.yml`.
- `policies` - folder for shared policies. These policies are referenced in `default.policies.yml` and team level `policies.yml`.
- `queries` - folder for shared queries. These queries are referenced in `default.queries.yml` and team level `queries.yml`.
- `default.policies.yml` - top-level file with all global policies (aka policies assigned to **all hosts**).
- `default.queries.yml` - top-level file with all global queries (aka queries that run on **all hosts**).
- `no-team.controls.yml` - top-level file with controls (configuration profiles, OS updates, setup experience, and scripts) that apply to **hosts assigned to "No team"**.
- `default.settings.yml` - top-level file with settings. These settings get applied to **hosts assigned to "No team"**. When a new team is created, it gets these settings.
- `teams` - folder for teams in Fleet. These folders contain team-level policies, queries, controls, and settings.
  - `<team name>` - folder for each team, with team-specific configs.
    - `<team name>.policies.yml` - policies config for a specific team. (Team name is duplicated in file name for easy searching.)
    - `<team name>.queries.yml` - queries config for a specific team. (Team name is duplicated in file name for easy searching.)
    - `<team name>.controls.yml` - controls config for a specific team, including configuration profiles, OS updates, setup experience, and scripts.
    - `<team name>.settings.yml` - settings config for a specific team, including agent options, command-line flags, and more. Team settings override global settings.
