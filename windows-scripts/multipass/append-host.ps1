$serverlist = get-content "c:\list.txt"

foreach ($server in $serverlist) {
    invoke-command -ComputerName $server -ScriptBlock {
        $hostfile = "C:\windows\system32\drivers\etc\hosts"
        try {
            "192.168.0.108    gitlab.internal.com" | Add-Content $hostfile -ErrorAction Stop
        }
        catch {
            $error[0]
        }
    }
}
