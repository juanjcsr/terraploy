# How to run the pipeline

## 1. Install the required packages and set the dependencies
```bash
```

## 2. Provision the infrastructure and install the gitops pipeline
```bash
cd terraform
terraform init
terraform apply
```

### 2.1 Get the gitops configuration
```bash
# fetch Argocd password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# Port forward to the argocd server
kubectl port-forward svc/argocd-server -n argocd 8080:80
```

Access the pipeline at http://localhost:8080

![alt text](docs/argocdhomepage.png)


# How to add a new app

## 1. Create a new app in ECR via terraform:

Append to the `terraform/main.tf` file:
```hcl
module "awscloud" {
    ...
    ecr_repos_names = [
        ...
        "NEW_APP_NAME"
    ]
}

```

and apply the changes:
```bash
cd terraform
terraform apply
```

## 2. Create a new app in the gitops repository

Create a new directory in the `/apps` directory with the name of the app and the corresponding Dockerfile

```bash
cd apps
mkdir NEW_APP_NAME

# Create the Dockerfile, example:
echo "FROM python:3.8-slim" > NEW_APP_NAME/Dockerfile
```

## 3. Describe the app in "definition"

Create a new folder in the `/definition` directory with the name of the app and the corresponding `values.yaml` file

```bash 
mkdir -p definition/NEW_APP_NAME
touch values.yaml
```

and describe the app in the `values.yaml` file:

```yaml
appName: NEW_APP_NAME  # The name of the app (required)
namespace: appnamespace # The namespace where the app will be deployed (required)
image:
  repository: juanjcsr/NEW_APP_NAME # The Dockerhub repository where the image will be stored (required)
  tag: latest # The tag of the image (required)

replicas: 1 # The number of replicas of the app

resources: # The resources of the app
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    cpu: 200m
    memory: 256Mi


```

If you want to enable the service, set `service.enabled` to `true` and describe the service in the `service` section:

```yaml
...
service:
  enabled: true
  type: ClusterIP
  port: 80
  targetPort: 80

```

You can also define limits and requests for the service:

```yaml
...
requests:
  cpu: 100m
  memory: 128Mi
limits:
  cpu: 200m
  memory: 256Mi
```

## 4. Add the app to the gitops pipeline

Commit the changes to the gitops repository and push them to the remote repository:

```bash
git add apps/ definition/

git push origin main
```

The pipeline will automatically deploy the app to the minikube cluster by default

