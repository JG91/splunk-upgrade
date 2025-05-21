# Splunk Universal Forwarder Supported Upgrade Paths

This document outlines recommended upgrade paths for Splunk Universal Forwarders (UF), particularly when upgrading from older versions that are no longer directly supported for upgrades to the latest version.

---

## 🔁 Why Use Intermediate Versions?

Splunk does **not support skipping major versions** in certain upgrade paths. For example:
- Upgrading directly from UF 6.4 → 9.x is not supported
- Certain configuration or feature changes may break the upgrade

> Always review the [official Splunk upgrade documentation](https://docs.splunk.com/Documentation/Splunk/latest/Installation/HowtoupgradeSplunk) before performing upgrades.

---

## 📊 General Upgrade Flow

Here’s a simplified example of supported upgrade transitions:

6.x → 6.6.x → 7.3.x → 8.2.x → 9.x


Each major upgrade step should be completed and verified before proceeding to the next.

---

## 🔍 Version-Specific Notes

### 🔸 Upgrading from 6.5.x or earlier
- Must first upgrade to **6.6**
- Then proceed to **7.3**
- Then proceed to **8.2**
- Then upgrade to **9.x**

### 🔸 Upgrading from 7.2.x or earlier
- Must first upgrade to **7.3**
- Then upgrade to **8.2**
- Then proceed to **9.2**

### 🔸 Upgrading from 8.1.x or ealier
- Must first upgrade to **8.2**
- Upgrade to **9.x** 

---

## 📁 Example Upgrade Matrix

| Current Version | Next Safe Upgrade | Notes |
|-----------------|-------------------|-------|
| 6.4.x           | 6.6.0             | Last of 6.6.x branch |
| 6.6.x           | 7.3.0             | Configuration migration required |
| 7.1.x           | 7.3.0             | Avoid direct 9.x upgrade |
| 7.3.x           | 8.2.0             | Stable point before 9.x |
| 8.1.x           | 8.2.0             | Stable point before 9.x |
| 8.2.x           | 9.x.x             | Straightforward upgrade |

---

## ✅ Recommended Intermediate Versions (Archival)

These versions are included in the repo for upgrade purposes:
- **6.6.0** – Final in 6.x, most stable bridge from 6.5 or earlier
- **7.3.0** – Final in 7.x, most stable bridge from 7.2 or earlier
- **8.2.0** – Stable base before 9.x transition

---

## ⚠️ Known Issues & Caveats

- Validate custom scripts or deployment apps after each upgrade step
- Configuration files (e.g., `inputs.conf`, `outputs.conf`) may change format
- TLS settings and cipher suites may be enforced differently in newer versions
- Python 2-based scripted inputs must be migrated (removed in UF 9.x)

---

## 🧪 Test Your Upgrade

Always:
1. Back up existing UF configuration (`$SPLUNK_HOME/etc`)
2. Test on a small sample before rolling out at scale
3. Monitor logs for post-upgrade errors

---

## 🧷 References

- [Splunk UF Upgrade Guide](https://docs.splunk.com/Documentation/Forwarder/latest/Forwarder/Installanixforwarder)
- [Splunk Enterprise Upgrade Docs](https://docs.splunk.com/Documentation/Splunk/latest/Installation/Aboutupgrading)
- [Version Compatibility Matrix](https://docs.splunk.com/Documentation/Splunk/latest/ReleaseNotes/MeetSplunk)

---
