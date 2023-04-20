Write-Host ""
Write-Host "##########################################################"
Write-Host "#                                                        #"
Write-Host "#                  KALI LINUX INSTALLER                   #"
Write-Host "#                                                        #"
Write-Host "#                 Created by GiuCoder                    #"
Write-Host "#                                                        #"
Write-Host "##########################################################"
Write-Host ""
Write-Host "This script will download and install Kali Linux."
Write-Host "Please make sure you have enough free space on your hard drive."
Write-Host ""

$confirmation = Read-Host -Prompt "Are you sure you want to continue? (Y/N)"
if($confirmation -ne "Y") {
    Write-Host "Script cancelled."
    exit
}

$url = "https://cdimage.kali.org/kali-2021.2/kali-linux-2021.2-installer-amd64.iso"
$output = "C:\kali-linux-2021.2-installer-amd64.iso"
Invoke-WebRequest -Uri $url -OutFile $output

Write-Host ""
Write-Host "#############################################"
Write-Host "#                                           #"
Write-Host "#         Creating Virtual Machine           #"
Write-Host "#                                           #"
Write-Host "#############################################"
Write-Host ""

& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" createvm --name "Kali Linux" --ostype "Linux_64" --register
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" modifyvm "Kali Linux" --memory 2048 --acpi on --boot1 dvd --nic1 natnetwork --nat-network1 "NatNetwork" --mouse usbtablet --audio none --clipboard bidirectional --ioapic on

Write-Host ""
Write-Host "#############################################"
Write-Host "#                                           #"
Write-Host "#     Attaching Kali Linux ISO to VM         #"
Write-Host "#                                           #"
Write-Host "#############################################"
Write-Host ""

& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" storagectl "Kali Linux" --name "IDE Controller" --add ide
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" storageattach "Kali Linux" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium $output

Write-Host ""
Write-Host "#############################################"
Write-Host "#                                           #"
Write-Host "#           Starting Kali Linux VM           #"
Write-Host "#                                           #"
Write-Host "#############################################"
Write-Host ""

& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "Kali Linux"

Write-Host ""
Write-Host "#############################################"
Write-Host "#                                           #"
Write-Host "#          KALI LINUX INSTALLATION           #"
Write-Host "#                                           #"
Write-Host "#############################################"
Write-Host ""

Write-Host "Follow the on-screen prompts to install Kali Linux on your virtual machine."

