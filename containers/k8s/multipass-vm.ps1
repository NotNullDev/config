#Requires -RunAsAdministrator

if ( $args.Count -ne 1 ) {
    Write-Output "Please provide name as first agrument.";
    exit;
}

$vmName = $args[0]

"Deleting VM $vmName" | Write-Output
multipass delete $vmName

"Purging unused VMS" | Write-Output
multipass purge

multipass launch --name $vmName -d 15G -m 2G --cpus 4 --network name=omga -v

"Preparing VM $vmName" | Write-Output
multipass exec "yes ubuntu | sudo passwd ubuntu; sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;" $vmName
multipass exec "git clone https://github.com/notnulldev/ansible-config-fork" $vmName

"Removing Default Switch Network interface from $vmName" | Write-Output
Stop-VM -Name $vmName -Force
Remove-VMNetworkAdapter -VMName $vmName -SwitchName "Deafult Switch"
Start-VM -Name $vmName

while ((get-vm -name $args[0]).state -ne 'Running') { start-sleep -s 5; Write-Output 'Waiting for VM $vmName to be started...' }

multipass exec "echo ssh $USER@$(ip a | grep 'inet.*eth0' | awk '{print $2}' | cut -d '/' -f1)" $vmName
"created vm $vmName" | Write-Output


#yes ubuntu | sudo passwd ubuntu; sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;" 
#multipass launch --name kubeadm -d 15G -m 2G --cpus 4 --network name=omga -v