## bashing into a pod
```
kubectl exec --namespace=$NAMESPACE $PODNAME --stdin --tty shell-demo -- /bin/bash
```

## portforwarding into the pod
```
kubectl port-forward $PODNAME $LOCALPORT:$PODPORT
```

