# fleet-mdm-gitops
This action applies the latest MDM configuration profiles to a Fleet team. 

#### Example usage

```yml
steps:
  - name: Apply configuration profiles and updates
    uses: fleetdm/fleet-mdm-gitops
    with:
      FLEET_API_TOKEN: ${{ secrets.FLEET_API_TOKEN }}
      FLEET_URL: ${{ secrets.FLEET_URL }}
      FLEET_TEAM_NAME: Workstations
      MDM_CONFIG_REPO: fleetdm/fleet
      MDM_CONFIG_DIRECTORY: mdm_profiles
      MAC_OS_MIN_VERSION: 13.3.1
      MAC_OS_VERSION_DEADLINE: 2023-05-15
      MAC_OS_ENABLE_DISK_ENCRYPTION: true
```
