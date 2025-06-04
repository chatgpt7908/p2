
#!/bin/bash

# Task 1: Check GitHub OAuth provider
if oc get oauth cluster -o yaml | grep -q 'github'; then
  echo "Task 1: ✅"
else
  echo "Task 1: ❌"
fi

# Task 2: Check build-approver role and binding
if oc get rolebinding build-approver -n cicd | grep -q 'jenkins'; then
  echo "Task 2: ✅"
else
  echo "Task 2: ❌"
fi

# Task 3: Check quota in phoenix project
if oc get quota ex280-quota -n phoenix | grep -q 'deployments: 2'; then
  echo "Task 3: ✅"
else
  echo "Task 3: ❌"
fi

# Task 4: Check multi-container pod in monitoring project
if oc get pod logger -n monitoring | grep -q 'busybox'; then
  echo "Task 4: ✅"
else
  echo "Task 4: ❌"
fi

# Task 5: Check node affinity in space project
if oc get deployment gravity -n space | grep -q 'zone=us-west'; then
  echo "Task 5: ✅"
else
  echo "Task 5: ❌"
fi

# Task 6: Check PDB in space project
if oc get pdb gravity-pdb -n space | grep -q 'minAvailable: 1'; then
  echo "Task 6: ✅"
else
  echo "Task 6: ❌"
fi

# Task 7: Check custom metrics HPA in galaxy project
if oc get hpa nova -n galaxy | grep -q 'http_requests_per_second'; then
  echo "Task 7: ✅"
else
  echo "Task 7: ❌"
fi

# Task 8: Check init container in infra project
if oc get deployment bootstrapper -n infra | grep -q 'initContainers'; then
  echo "Task 8: ✅"
else
  echo "Task 8: ❌"
fi

# Task 9: Check Istio sidecar injection in meshzone project
if oc get deployment echo -n meshzone | grep -q 'istio-proxy'; then
  echo "Task 9: ✅"
else
  echo "Task 9: ❌"
fi

# Task 10: Check PVC expansion in galaxy project
if oc get pvc data-pvc -n galaxy | grep -q '5Gi'; then
  echo "Task 10: ✅"
else
  echo "Task 10: ❌"
fi

# Task 11: Check Let's Encrypt certificate in orbit project
if oc get secret tls-cert -n orbit | grep -q 'letsencrypt'; then
  echo "Task 11: ✅"
else
  echo "Task 11: ❌"
fi

# Task 12: Check Docker config secret in vault project
if oc get secret docker-config -n vault | grep -q 'dockerconfigjson'; then
  echo "Task 12: ✅"
else
  echo "Task 12: ❌"
fi

# Task 13: Check validating webhook
if oc get validatingwebhookconfiguration pod-webhook | grep -q 'hostNetwork: true'; then
  echo "Task 13: ✅"
else
  echo "Task 13: ❌"
fi

# Task 14: Check Kiali Operator in openshift-operators
if oc get csv -n openshift-operators | grep -q 'Kiali'; then
  echo "Task 14: ✅"
else
  echo "Task 14: ❌"
fi

# Task 15: Check custom SCC in monitoring project
if oc get scc restricted-logs | grep -q '/var/log/app'; then
  echo "Task 15: ✅"
else
  echo "Task 15: ❌"
fi

# Task 16: Check ConfigMap reload in devops project
if oc get deployment hotreload -n devops | grep -q 'configmap'; then
  echo "Task 16: ✅"
else
  echo "Task 16: ❌"
fi

# Task 17: Check CronJob with PVC in infra project
if oc get cronjob logrotate -n infra | grep -q 'PVC'; then
  echo "Task 17: ✅"
else
  echo "Task 17: ❌"
fi

# Task 18: Check user workload monitoring in devops project
if oc get prometheusrule cpu-alert -n devops | grep -q '80%'; then
  echo "Task 18: ✅"
else
  echo "Task 18: ❌"
fi

# Task 19: Check multi-tenancy isolation in team-a and team-b projects
if oc get networkpolicy isolation -n team-a | grep -q 'team-b'; then
  echo "Task 19: ✅"
else
  echo "Task 19: ❌"
fi

# Task 20: Check ArgoCD deployment in argocd namespace
if oc get deployment argocd-server -n argocd | grep -q 'argocd'; then
  echo "Task 20: ✅"
else
  echo "Task 20: ❌"
fi

# Task 21: Check backup and restore in phoenix project
if oc get project phoenix-restore | grep -q 'phoenix'; then
  echo "Task 21: ✅"
else
  echo "Task 21: ❌"
fi

# Task 22: Check pre-upgrade check report
if [ -f /root/pre-upgrade-report.txt ]; then
  echo "Task 22: ✅"
else
  echo "Task 22: ❌"
fi
