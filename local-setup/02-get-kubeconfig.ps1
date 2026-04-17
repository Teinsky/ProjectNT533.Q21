$FloatingIP = Read-Host "Nhập Floating IP của VM1"
$SSHKey = "C:\đường\dẫn\tới\okd-keypair.pem"

$k3sConfig = ssh -i $SSHKey ubuntu@$FloatingIP "sudo cat /etc/rancher/k3s/k3s.yaml"
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.kube"
$k3sConfig = $k3sConfig -replace "server: https://127.0.0.1:6443", "server: https://$FloatingIP:6443"
$k3sConfig | Out-File -FilePath "$env:USERPROFILE\.kube\config" -Encoding utf8 -NoNewline
Write-Host "Đã lấy cấu hình thành công!"
Test-Path "$env:USERPROFILE\.kube\config"
