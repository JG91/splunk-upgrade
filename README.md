# Splunk Upgrade Path & Universal Forwarder Archive

This repository is dedicated to documenting Splunk upgrade procedures and storing archived versions of the **Splunk Universal Forwarder (UF)** needed to upgrade older environments.

It supports environments where:
- Universal Forwarders are too old for direct upgrades to the latest version
- Archived installers are needed due to air-gapped or offline environments
- A structured upgrade path is necessary to avoid version compatibility issues

## Repository Structure
```
.
├── upgrade-paths/
│ └── splunk-supported-upgrade-paths.md
├── universal-forwarder/
│ ├── splunkforwarder-6.6.0/
│ ├── splunkforwarder-7.3.0/
│ ├── splunkforwarder-8.2.0/
│ └── ...
├── upgrade-scripts/
│ └── upgrade_uf.sh
└── README.md
```

## Universal Forwarder Versions

This repository includes archived versions of Splunk UF commonly used as intermediate steps in upgrade processes. All versions are sourced from official Splunk downloads.

## Upgrade Strategy

1. Identify the current UF version.
2. Consult `upgrade-paths/splunk-supported-upgrade-paths.md` for a safe upgrade path.
3. Use the provided installers or your organization's download mirror.
4. Run upgrade manually or with a script (`upgrade-scripts/upgrade_uf.sh`).

## Contributing

You’re welcome to:
- Add missing forwarder versions (especially those not available on Splunk’s site)
- Improve documentation or add automation scripts

## License

[MIT](LICENSE)
