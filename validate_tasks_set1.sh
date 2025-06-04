
#!/bin/bash

# Task 1: Check LDAP identity provider
if oc get oauth cluster -o yaml | grep -q 'htpass-ex280'; then
  echo "Task 1: ✅"
else
  echo "Task 1: ❌"
fi

# Task 2: Check custom role and binding
if oc get rolebinding project-auditor -n xmen | grep -q 'logan'; then
  echo "Task 2: ✅"
else
  echo "Task 2: ❌"
fi

# Task 3: Check quota in nebula project
if oc get quota ex280-quota -n nebula | grep -q 'pods: 5'; then
  echo "Task 3: ✅"
else
  echo "Task 3: ❌"
fi

# Task 4: Check LimitRange in nebula project
if oc get limitrange ex280-limits -n nebula | grep -q 'default: 200m'; then
  echo "Task 4: ✅"
else
  echo "Task 4: ❌"
fi

# Task 5: Check deployment in galaxy project
if oc get deployment nova -n galaxy | grep -q 'env=prod'; then
  echo "Task 5: ✅"
else
  echo "Task 5: ❌"
fi

# Task 6: Check secure route in galaxy project
if oc get route quantum -n galaxy | grep -q 'wildcardPolicy: Subdomain'; then
  echo "Task 6: ✅"
else
  echo "Task 6: ❌"
fi

# Task 7: Check PV and PVC in galaxy project
if oc get pvc data-pvc -n galaxy | grep -q 'data-pv'; then
  echo "Task 7: ✅"
else
  echo "Task 7: ❌"
fi

# Task 8: Check PVC retention policy in nebula project
if oc get pvc -n nebula | grep -q 'Retain'; then
  echo "Task 8: ✅"
else
  echo "Task 8: ❌"
fi

# Task 9: Check deny-all network policy in orbit project
if oc get networkpolicy deny-all -n orbit | grep -q 'policyTypes: Ingress'; then
  echo "Task 9: ✅"
else
  echo "Task 9: ❌"
fi

# Task 10: Check egress network policy in orbit project
if oc get networkpolicy egress-dns -n orbit | grep -q '8.8.8.8'; then
  echo "Task 10: ✅"
else
  echo "Task 10: ❌"
fi

# Task 11: Check service account in nebula project
if oc get sa scanner -n nebula | grep -q 'view'; then
  echo "Task 11: ✅"
else
  echo "Task 11: ❌"
fi

# Task 12: Check SCC in nebula project
if oc get scc restricted-v2 | grep -q 'readOnlyRootFilesystem: true'; then
  echo "Task 12: ✅"
else
  echo "Task 12: ❌"
fi

# Task 13: Check HPA in galaxy project
if oc get hpa nova -n galaxy | grep -q 'minReplicas: 3'; then
  echo "Task 13: ✅"
else
  echo "Task 13: ❌"
fi

# Task 14: Check readiness probe in galaxy project
if oc get deployment nova -n galaxy | grep -q 'httpGet: /healthz'; then
  echo "Task 14: ✅"
else
  echo "Task 14: ❌"
fi

# Task 15: Check ConfigMap in nebula project
if oc get configmap env-vars -n nebula | grep -q 'APP_MODE=production'; then
  echo "Task 15: ✅"
else
  echo "Task 15: ❌"
fi

# Task 16: Check TLS secret in orbit project
if oc get secret tls-cert -n orbit | grep -q 'tls.crt'; then
  echo "Task 16: ✅"
else
  echo "Task 16: ❌"
fi

# Task 17: Check CronJob in nebula project
if oc get cronjob backup -n nebula | grep -q '2:30 AM'; then
  echo "Task 17: ✅"
else
  echo "Task 17: ❌"
fi

# Task 18: Check Elasticsearch Operator in openshift-operators-redhat
if oc get csv -n openshift-operators-redhat | grep -q 'Elasticsearch'; then
  echo "Task 18: ✅"
else
  echo "Task 18: ❌"
fi

# Task 19: Check project template
if oc get template project-template -n openshift-config | grep -q 'LimitRange'; then
  echo "Task 19: ✅"
else
  echo "Task 19: ❌"
fi

# Task 20: Check OpenShift project template configuration
if oc get project.config.openshift.io/cluster | grep -q 'project-template'; then
  echo "Task 20: ✅"
else
  echo "Task 20: ❌"
fi

# Task 21: Check must-gather diagnostics
if [ -f /root/cluster-dump.tar.gz ]; then
  echo "Task 21: ✅"
else
  echo "Task 21: ❌"
fi

# Task 22: Check Prometheus metrics scraping
if oc get deployment nova -n galaxy | grep -q 'prometheus.io/scrape: true'; then
  echo "Task 22: ✅"
else
  echo "Task 22: ❌"
fi
