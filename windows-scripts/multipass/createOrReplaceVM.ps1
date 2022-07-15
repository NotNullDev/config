#Requires -RunAsAdministrator
if ($args.Count -ne 1) {
    Write-Output "Please provide VM name as first agrument.";
    exit;
}

$vmName = $args[0]

"Deleting VM $vmName" | Write-Output
multipass delete $vmName

"Purging unused VMS" | Write-Output
multipass purge

multipass launch --name $vmName -d 15G -m 2G --cpus 4 --network name=omga -v

"Preparing VM $vmName" | Write-Output
multipass transfer startup.sh showssh.sh "$($vmName):."
multipass exec $vmName -- sudo bash startup.sh

"Getting ssh credentials" | Write-Output
$sshVMAddress=$(multipass exec $vmName -- bash ./showssh.sh)
Write-Output $sshVMAddress

"Removing Default Switch Network interface from $vmName" | Write-Output
Stop-VM -Name $vmName -Force


While(Get-VMNetworkAdapter $vmName | Where-Object {$_.SwitchName -eq "Default Switch"}) {
    try {
        Get-VMNetworkAdapter $vmName | Where-Object {$_.SwitchName -eq "Default Switch"} | Remove-VMNetworkAdapter
    } catch {
        "ERROR: Default Switch switch doesn't exists on given VM." | Write-Output
        Start-Sleep -s 5
    }
}


Start-VM -Name $vmName
while ((get-vm -name $vmName).state -ne 'Running') { start-sleep -s 5; Write-Output 'Waiting for VM ' + $vmName + ' to be started...' }

"Installation completed. You can login now using(ssh,password):" | Write-Output
"$sshVMAddress" | Write-Output
"qwqw" | Write-Output


#yes ubuntu | sudo passwd ubuntu; sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;" 
#multipass launch --name kubeadm -d 15G -m 2G --cpus 4 --network name=omga -v