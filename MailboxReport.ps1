# 1. Connect to Exchange Online
Connect-ExchangeOnline

# 2. Define the output path
$outputPath = "$HOME\Desktop\MailboxSizeReport.csv"

# 3. Fetch mailboxes and link their statistics
Write-Host "Generating report, please wait..." -ForegroundColor Cyan

$report = Get-EXOMailbox -ResultSize Unlimited -RecipientTypeDetails UserMailbox | ForEach-Object {
    $stats = Get-EXOMailboxStatistics -Identity $_.ExternalDirectoryObjectId
    
    [PSCustomObject]@{
        DisplayName  = $_.DisplayName
        EmailAddress = $_.PrimarySmtpAddress
        # Formats the size to GB for better readability
        MailboxSizeGB = [math]::Round(($stats.TotalItemSize.Value.ToString().Split("(")[1].Split(" ")[0].Replace(",","") / 1GB), 2)
    }
}

# 4. Export the data to CSV
$report | Export-Csv -Path $outputPath -NoTypeInformation

Write-Host "Report completed and saved to: $outputPath" -ForegroundColor Green

# 5. Disconnect (Best practice)
Disconnect-ExchangeOnline -Confirm:$false