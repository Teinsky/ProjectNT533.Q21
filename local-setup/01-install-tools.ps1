Write-Host "Đang cài đặt kubectl..."
winget install Kubernetes.kubectl

Write-Host "Đang cài đặt helm..."
winget install Helm.Helm

Write-Host "Kiểm tra phiên bản:"
kubectl version --client
helm version
