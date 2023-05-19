# fleet-mdm-gitops
This GitHub Action applies the latest MDM configuration profiles to a group of hosts in [Fleet](https://fleetdm.com).  It lets everyone contribute, while giving you history and an approval workflow.

![image](https://github.com/fleetdm/fleet-mdm-gitops/assets/618009/83cb87b6-2303-40e4-bc5b-e0f8168a00c7)

## Example usage

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


## Contributing

Please observe the guidelines and conventions laid out in the [Fleet contribution guide](https://fleetdm.com/) when opening issues or submitting pull requests.

### Help

Unsure?  If you run into any trouble or questions, click [here](https://fleetdm.com/slack).


### Bugs

If you suspect you've found a bug, please [report the bug here](https://github.com/fleetdm/fleet/issues).  Thanks!


## License

This GitHub Action is free and open-source under the MIT License.
