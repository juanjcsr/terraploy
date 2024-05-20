resource "helm_release" "argocd" {
  name       = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  create_namespace = true

  values = [file("../charts/argo-cd/values.yaml")]
}

resource "helm_release" "argocd_config" {
    namespace = "argocd"
    depends_on = [helm_release.argocd]
    name = "argocd-config"
    chart = "../charts/root-app"
}

resource "null_resource" "clean_up_argocd_resources" {
  provisioner "local-exec" {
    command     = <<-EOT
      kubeconfig=~/.kube/config
      
      kubectl --kubeconfig $kubeconfig get Application -A -o name | xargs -I {} kubectl --kubeconfig $kubeconfig -n argocd patch -p '{"metadata":{"finalizers":null}}' --type=merge {} 2> /tmp/tf.clean_up_argocd_resources.err.log || true
      #rm -f $kubeconfig
    EOT
    interpreter = ["bash", "-c"]
    when        = destroy
  }
}
