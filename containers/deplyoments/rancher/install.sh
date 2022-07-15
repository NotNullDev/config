current_machine_ip="192.168.0.21"
rancher_admin_password="qwertyASD123!"

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

kubectl create namespace cattle-system

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml

helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.7.1

helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=$current_machine_ip.sslip.io \
  --set replicas=1 \
  --set bootstrapPassword="$rancher_admin_password"

echo "Now if you navigate to <IP_OF_LINUX_NODE>.sslip.io in a web browser, you should see the Rancher UI."