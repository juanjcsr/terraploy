
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata.0.name

  values = [file("charts/argo-cd/values.yaml")]
}

resource "helm_release" "argocd_config" {
    namespace = "argocd"
    depends_on = [helm_release.argocd]
    name = "argocd-config"
    chart = "charts/root-app"
}
