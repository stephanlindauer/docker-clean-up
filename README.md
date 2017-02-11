# docker-clean-up

## Standalone:
Build:
```
docker build -t docker-clean-up .
```
Run:
```
docker run -v /var/run/docker.sock:/var/run/docker.sock:rw docker-clean-up
```
## Kubernetes DaemonSet:

```
kubectl apply -f - << EOF
apiVersion: extensions/v1beta1
kind: DaemonSet
metadata:
  labels:
    name: docker-clean-up
  name: docker-clean-up
spec:
  template:
    metadata:
      labels:
        app: docker-clean-up
    spec:
      volumes:
        - name: docker-socket
          hostPath:
            path: /var/run/docker.sock
      containers:
        - image: stephanlindauer/docker-clean-up
          name: docker-clean-up
          env:
            - name: CRONTAB
              value: "0 2 * * 0"
          volumeMounts:
            - mountPath: /var/run/docker.sock
              name: docker-socket
EOF
```
Adjust schedule to your preference.
In this config it runs every Sunday at 2 am.
