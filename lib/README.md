# `lib/`

This folder is for files referenced by `path` in Fleet config YAML.

This can reduce duplication for policies, scripts, and other config that is the same across multiple teams in Fleet Premium.

### Examples

##### Policies

```yaml
# default.yml
policies:
  - path: ./lib/macos-device-health.policies.yml
```

##### Queries

```yaml
# default.yml
queries:
  - path: ./lib/collect-usb-devices.queries.yml
```

##### Scripts

```yaml
# default.yml
controls:
  scripts:
    - path: ./lib/remove-zoom-artifacts.script.sh
```

##### Agent options

```yaml
# default.yml
agent_options:
  path: ./lib/agent-options.yml
```