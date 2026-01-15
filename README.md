# Exchange-Online-Mailbox-Size-Report
Powershell script to create a csv file of all mailboxes and their size in GB. 

It’s great to hear you got the module installed and the script running! Documentation is a key part of any admin's toolkit—it ensures that if you (or a teammate) need to run this again in six months, you won't have to troubleshoot from scratch.

Here is a clean, professional User Guide in Markdown format that you can save as a `README.md` file alongside your script.

---

# User Guide: Exchange Online Mailbox Size Report

## Overview

This PowerShell script connects to **Exchange Online** and generates a CSV report containing essential mailbox information. It is designed to help administrators monitor storage usage across the organization.

### Report Details

The generated CSV file includes:

* **Display Name**: The full name of the user.
* **Email Address**: The primary SMTP address.
* **Mailbox Size (GB)**: The current size of the mailbox, rounded to two decimal places.

---

## Prerequisites

1. **Permissions**: You must have the **Global Administrator** or **Exchange Administrator** role.
2. **PowerShell Version**: Windows PowerShell 5.1 or PowerShell 7+.
3. **Internet Access**: Required to connect to the Exchange Online service.

---

## First-Time Setup

If this is your first time running Exchange Online scripts on this computer, you must perform these two steps in a PowerShell window opened as **Administrator**:

### 1. Enable Script Execution

By default, Windows blocks local scripts. Run this to allow them:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

```

### 2. Install the Management Module

Install the official Microsoft module required to talk to Exchange Online:

```powershell
Install-Module -Name ExchangeOnlineManagement -Force

```

---

## How to Run the Script

1. **Open PowerShell** and navigate to the folder where you saved the script.
2. **Execute the script** by typing:
```powershell
./MailboxReport.ps1

```


3. **Sign In**: A Microsoft login window will appear. Enter your admin credentials and complete the Multi-Factor Authentication (MFA) if prompted.
4. **Wait for Completion**: The script will display a "Generating report..." message. Once finished, it will provide the file path of the CSV.

---

## Output Location

By default, the script saves the report to your **Desktop**:
`C:\Users\<YourUser>\Desktop\MailboxSizeReport.csv`

| Column | Description |
| --- | --- |
| **DisplayName** | The user's name as it appears in the Address Book. |
| **EmailAddress** | The user's unique primary email. |
| **MailboxSizeGB** | Total size of items in the mailbox (measured in Gigabytes). |

---

## Troubleshooting

* **"Connect-ExchangeOnline is not recognized"**: Repeat the "First-Time Setup" steps above.
* **Authentication Failed**: Ensure you are using an account with sufficient permissions and that your internet connection is stable.
* **Empty CSV**: If the CSV is empty, ensure you have active `UserMailboxes` in your tenant; the script is filtered to skip shared mailboxes or resource mailboxes.

---

**Would you like me to show you how to modify the script so it automatically emails this CSV to you once it's finished?**
