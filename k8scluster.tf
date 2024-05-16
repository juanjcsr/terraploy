

resource "helm_release" "argocd" {
  name       = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  create_namespace = true

  values = [file("values/argocd.yaml")]
}

resource "helm_release" "argocd_config" {
    namespace = "argocd"
    depends_on = [helm_release.argocd]
    name = "argocd-config"
    chart = "./values/argocdapps/root-app"
}
