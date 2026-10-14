# Day 59 – Helm — Kubernetes Package Manager

## Task
Over the past eight days you have written Deployments, Services, ConfigMaps, Secrets, PVCs, and more — all as individual YAML files. For a real application you might have dozens of these. Helm is the package manager for Kubernetes, like apt for Ubuntu. Today you install charts, customize them, and create your own.

---

## Challenge Tasks

### Task 1: Install Helm
1. Install Helm (brew, curl script, or chocolatey depending on your OS)
2. Verify with `helm version` and `helm env`

Three core concepts:
- **Chart** — a package of Kubernetes manifest templates
- **Release** — a specific installation of a chart in your cluster
- **Repository** — a collection of charts (like a package repo)

**Verify:** What version of Helm is installed?
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task1.png)

---

### Task 2: Add a Repository and Search
1. Add the Bitnami repository: `helm repo add bitnami https://charts.bitnami.com/bitnami`
2. Update: `helm repo update`
3. Search: `helm search repo nginx` and `helm search repo bitnami`
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task2-1.png)
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task2-2.png)

**Verify:** How many charts does Bitnami have?

---

### Task 3: Install a Chart
1. Deploy nginx: `helm install my-nginx bitnami/nginx`
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task3-1.png)

2. Check what was created: `kubectl get all`
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task3-2.png)

3. Inspect the release: `helm list`, `helm status my-nginx`, `helm get manifest my-nginx`
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task3-3.png)
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task3-4.png)

One command replaced writing a Deployment, Service, and ConfigMap by hand.

**Verify:** How many Pods are running? What Service type was created?

---

### Task 4: Customize with Values
1. View defaults: `helm show values bitnami/nginx`
2. Install a custom release with `--set replicaCount=3 --set service.type=NodePort`
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task4-2-1.png)
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task4-2-2.png)

3. Create a `custom-values.yaml` file with replicaCount, service type, and resource limits --- [custom-values](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/manifests/custom-values.yml)

5. Install another release using `-f custom-values.yaml`
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task4-4.png)

6. Check overrides: `helm get values <release-name>`
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task4-5.png)

**Verify:** Does the values file release have the correct replicas and service type?

---

### Task 5: Upgrade and Rollback
1. Upgrade: `helm upgrade my-nginx bitnami/nginx --set replicaCount=5`
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task5-1.png)

2. Check history: `helm history my-nginx`
3. Rollback: `helm rollback my-nginx 1`
4. Check history again — rollback creates a new revision (3), not overwriting revision 2
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task5-4.png)

Same concept as Deployment rollouts from Day 52, but at the full stack level.

**Verify:** How many revisions after the rollback?

---

### Task 6: Create Your Own Chart
1. Scaffold: `helm create flask-app`
2. Explore the directory: `Chart.yaml`, `values.yaml`, `templates/deployment.yaml`
3. Look at the Go template syntax in templates: `{{ .Values.replicaCount }}`, `{{ .Chart.Name }}`
4. Edit `values.yaml` — set replicaCount to 3 and image to nginx:1.25
5. Validate: `helm lint flask-app`
6. Preview: `helm template my-flask-app ./flask-app`
7. Install: `helm install my-flask-app ./flask-app`
8. Upgrade: `helm upgrade my-flask-app ./flask-app --set replicaCount=5`
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task6-7-1.png)
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task6-7-2.png)

**Verify:** After installing, 3 replicas? After upgrading, 5?

---

### Task 7: Clean Up
1. Uninstall all releases: `helm uninstall <name>` for each
2. Remove chart directory and values file
3. Use `--keep-history` if you want to retain release history for auditing
![image](https://github.com/bisht2311/90DaysOfDevOps/blob/848f7895d8707264a8d79ee0de07cce4e7e17255/2026/day-59/images/task7.png)

**Verify:** Does `helm list` show zero releases?

---

## Hints
- `helm show values <chart>` — see what you can customize
- `--set key=value` for single overrides, `-f values.yaml` for files
- Nested values use dots: `--set service.type=NodePort`
- `helm get values <release>` shows overrides, `--all` for everything
- `helm template` renders without installing — great for debugging
- `helm lint` validates chart structure before installing
- Templates: `{{ .Values.key }}`, `{{ .Chart.Name }}`, `{{ .Release.Name }}`

---
## Key Takeaways:

**1. What Helm is and the three core concepts**
  - Helm package manager for Kubernetes applications includes templating and lifecycle management functionality.
  - It is a package manager for Kubernetes manifests (such as Deployments, ConfigMaps, Services, etc.)

- Three core concepts:
    - **Chart** — a package of Kubernetes manifest templates
    - **Release** — a specific installation of a chart in your cluster
    - **Repository** — a collection of charts (like a package repo)


**2. How to install, customize, upgrade, and rollback**

```bash
## Install
helm install my-app ./my-chart
## With custom values
helm install my-app ./my-chart -f values.yaml

## Customize
## Method 1: values.yaml
replicaCount: 3
image:
  repository: nginx
  tag: "1.25"
## Method 2: CLI override
helm install my-app ./my-chart \
  --set replicaCount=5 \
  --set image.tag=latest

## Upgrade - Helm tracks changes and applies only diffs.
helm upgrade my-app ./my-chart -f values.yaml

## Rollback
helm rollback my-app 1

## Check revisions
helm history my-app
```


**3. The structure of a Helm chart and how Go templating works**
```bash
nginx-chart/
├── Chart.yaml
├── values.yaml
├── charts/
├── templates/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── _helpers.tpl
│   └── ingress.yaml
└── .helmignore
```

- `Chart.yaml` metadata
- `values.yaml` (default config) This is where all configurable variables live.
- `templates/` Contains Kubernetes manifests with Go templating
- `charts/` Used for dependencies (subcharts)
- `Go templating in Helm`
  - Helm uses Go-based templates to turn parameterized files into valid Kubernetes YAML.
  - Placeholders inside {{ ... }} are replaced with actual values during rendering.
  - Configuration values are sourced from:
    - Default values.yaml
    - User-provided files via -f
    - Command-line overrides using --set
- This allows the same chart to be reused across environments with different configurations.

**4. custom-values.yaml with explanations**

```bash

# Number of pod replicas to run (scaling)
replicaCount: 3 

service:
  type: NodePort  # Exposes service externally via <NodeIP>:<NodePort>
  port: 80        # Internal service port inside the cluster

resources:
  requests:
    cpu: "100m"     # Minimum CPU guaranteed
    memory: "128Mi" # Minimum memory guaranteed
  limits:
    cpu: "250m"     # Max CPU allowed
    memory: "256Mi" # Max memory allowed

```
