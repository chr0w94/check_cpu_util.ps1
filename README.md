# check_cpu_util.ps1
A lightweight PowerShell script to monitor CPU utilization on a Windows system. It checks the current CPU load and returns a status based on user-defined warning and critical thresholds.
Build for Icinga / Icinga2 / Nagios monitoring system.

## 📄 Description

This script is designed to check the CPU utilization of the local computer using WMI. Depending on the current CPU load, it returns one of three states:

- **OK**: CPU utilization is below the warning threshold
- **WARNING**: CPU utilization exceeds the warning threshold
- **CRITICAL**: CPU utilization exceeds the critical threshold

Exit codes follow standard monitoring tool conventions:
- `0`: OK
- `1`: WARNING
- `2`: CRITICAL

## ⚙️ Usage

```powershell
.\check_cpu_util.ps1 [-WARN <int>] [-CRIT <int>]
```

### Parameters

| Parameter | Type | Description | Default |
|----------|------|-------------|---------|
| `-WARN`  | int  | Warning threshold for CPU utilization (%) | 80 |
| `-CRIT`  | int  | Critical threshold for CPU utilization (%) | 90 |

### Example

```powershell
.\check_cpu_util.ps1 -WARN 75 -CRIT 90
```

## ✅ Requirements

- PowerShell 4.0 or higher
- Windows with WMI access enabled

## 🔄 Exit Codes

| Code | Meaning   |
|------|-----------|
| `0`  | OK        |
| `1`  | WARNING   |
| `2`  | CRITICAL  |


## License

This project is licensed under the GNU General Public License v2.0 or later. See the [LICENSE](LICENSE) file for details.

## 👤 Author

Developed by chr0w94.
