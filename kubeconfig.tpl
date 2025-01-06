apiVersion: v1
kind: Config
current-context: ${cluster_name}
preferences: {}
clusters:
- cluster:
    certificate-authority-data: ${cluster_ca_certificate}
    server: ${cluster_endpoint}
  name: ${cluster_name}
contexts:
- context:
    cluster: ${cluster_name}
    user: ${cluster_name}
  name: ${cluster_name}
users:
- name: ${cluster_name}
  user:
    token: ${access_token}