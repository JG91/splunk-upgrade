# Splunk Universal Forwarder Installers Archive

This directory contains archived versions of **Splunk Universal Forwarder (UF)** installers for different operating systems and architectures. These files are used to support upgrade paths where direct upgrade from older versions to the latest is not supported or recommended.

## 📌 Purpose

Splunk does not always support skipping multiple major versions when upgrading Universal Forwarders. This archive helps:

- Preserve important intermediate versions (e.g., 6.x → 7.x → 8.x → latest).
- Enable offline or automated upgrades in restricted environments.
- Avoid repeated downloads from Splunk's archive (especially useful in air-gapped networks).

## 📁 Folder Structure

Each subfolder corresponds to a specific UF version and contains all four major installation formats:
```
universal-forwarder/
├── 6.6.0/
│ ├── splunkforwarder-6.6.0.tgz
│ ├── splunkforwarder-6.6.0.rpm
│ ├── splunkforwarder-6.6.0.deb
│ └── splunkforwarder-6.6.0.msi
├── 7.3.0/
│ └── ...
└── 8.2.0/
└── ...
```


> All installers are official builds downloaded from Splunk’s previous releases archive.

## 📦 Splitting Large Installer Files

GitHub does not allow files larger than 100 MB, and commits over 25 MB can lead to issues. To avoid this, files are split using the `split` command.

### 🔹 To Split (Before Uploading to GitHub)

```bash
split -b 25M splunkforwarder-8.2.6.tgz splunkforwarder-8.2.6.tgz.part-
```
This creates:
```
splunkforwarder-8.2.0-e053ef3c985f-Linux-x86_64.tgz.part-aa
splunkforwarder-8.2.0-e053ef3c985f-Linux-x86_64.tgz.part-ab
...
```

### 🔹 To Recombine (After Cloning the Repo)

Use cat to merge the parts back into the original installer:
```bash
cat splunkforwarder-8.2.0-e053ef3c985f-Linux-x86_64.tgz.part-* > splunkforwarder-8.2.0-e053ef3c985f-Linux-x86_64.tgz
```
Then proceed to use the .tgz file as usual.

✅ Ensure the parts are concatenated in the correct order using wildcard expansion (part-*) or explicitly (part-aa, part-ab, ...).


## 🧭 How to Use

1. Identify the current version of the UF deployed on your hosts.
2. Refer to the [Splunk Supported Upgrade Path](https://docs.splunk.com/Documentation/Forwarder/latest/Forwarder/Upgrade#Upgrade_paths) to determine the necessary intermediate versions.
3. Download or copy the required installers to the target machine.
4. Use [upgrade scripts](../upgrade-scripts/upgrade_uf.sh) to automate the upgrade process.

## 📎 Notes

- You may need to log in to your Splunk account to obtain the original files.
- For security and compliance, verify file integrity and official hashes where possible.
- Make sure your team agrees on upgrade versions to avoid version fragmentation.



## 🔗 Related

- [Upgrade Script](../upgrade-scripts/upgrade_uf.sh)
- [UF Download Links](../uf-download-links.md)
- [Splunk Upgrade Documentation](https://docs.splunk.com/Documentation/Forwarder/latest/Forwarder/Upgrade)
