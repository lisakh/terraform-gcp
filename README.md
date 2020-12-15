# terraform-gcp
Terraform and Google Cloud Platform

### Links
https://35.198.68.69/ - Rancher, Kubernetes cluster management cluster

http://kibana.elastic.34.107.73.167.xip.io/ - Kibana UI connected to elasticsearch

http://elastic.elastic.34.107.73.167.xip.io/ - elastic search rest endpoint

https://35.198.68.69/k8s/clusters/c-q444s/api/v1/namespaces/cattle-prometheus/services/http:access-grafana:80/proxy/d/icjpCppik/cluster?orgId=1&refresh=1m&from=now-12h&to=now - Grafana UI, cluster overview

### Connection
###### SSH
Pivate key to connect to the nodes

-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAlC6SAdEJxdfXvsXnd4h0EGMuxphwKFLXCAmEYGMB+GGXuU8S
aW0YU1dd6OHUocNrHl8jUx/R5WCKq7g0EcMkuvNJcqkdbLfnP+0lq5QeP3UizyqT
SyeEJVbN5Iw7XVYJLIUL+riO46RIqtP00yQ437sg/LdqaJcy1stYalh8AlYHI+R2
tLSC723Db3xQdglDkneFIXYcyuHpwokfOKdHtmBpx+CgWcMf7Hl6OeS2B8Z4k0yR
lJwElSvXP70rkmowuUbDp3jWuX4FJ4Fv2cnLZJ2qYYyDEnEa0y/v2uJEjZkE0OOD
CHEMt8dO5510sHCQUrdaE6QdVvHbNF7kiOdgAQIDAQABAoIBAClHD8URxfcmuSKb
Xm8dw7cM6erIa/XPnbbPb+Cps9LM3MbyD97uVOhiXfaRcfndxekf92cgZgfPbNGI
7nhEM+cf/kXCdj/iurhEB0pUaFik+J1c7srwpw7/rzsLFT5ayRNtvHiLEMK48MUl
Zf2rCWzJY9cCANJBzBepbWeyXlkH0VFmTFrNGRj6u3sOWv92kWOOn6/UGFXMiw14
msTaydpk975jhNnMjCxUdNc0hvm5uHyVaAl/o4spNZNwRa/2l12d1HXjjCpdqntJ
MAUNRCHrwuap6BwolPkKTdIseGgOuMEDrFuLLiM5LoHLIb8xGOTDDCvUp/oG1DAD
O77z8UECgYEAwPplG6YzLyOFwXFrdTlJ0PRKq8nsglwYdDPlckIcjfk+3RiuHOqX
ooGvy7LmDe4fDh3KFMIMjv1We6qj6bxTwjeYEqDvdUeUU7e4IDgrn/zuBLBp+O0B
rx0b8hV4Xrbu07sRdWPumVUuzGMP1YTLsDhK0DlK22L51RI6p3ujKpcCgYEAxJMQ
//MACeU0rYzZIQuXDNa3AxhwIrUrRS2pnjDMe4RiIvYpt7+yeUEME8bOqwqcnYaX
Seg3U1aWv+ufEypGyqlSctMLe7mSWOlXLOEmrcWyRaE/8tbl3pArrX998Te2+Bmv
UEo1lQ/tS55xwDtPR3QAmyUM65dSsTpE1LEOlScCgYEAgRiA/wgmAYjf99KqMldK
vFBQi6+fWm3Fpib5fYAgnhF5LmtOPuXo3runILvjDrqXZ9gh0dUmlZmAe2ZiFQD5
f1m1j/C9gFWMMp0aveMVvAd2KwjhO7dBgyYUBdS7G5GBH39rZH6fpU/I6M30T8Bw
ish9s+I/45fIzfNN7bDWLK0CgYB3qzRJLMzUOVX1ZW51oJGnPjuRxdnWN0aNSbwd
0oVZmIEJ2aQR+cCT8paAn6IHHGG1wE7vrk+oC2mgkrd3ul/4VlYcEwDFpHZEbGEm
sDaUyWq62uyMUGkGMex1Jc0tAQcBSNmiXlr6UQTb6SxEo5ai4CrSSB7yeV/dBqUK
enNvNwKBgHVa7K/OZSMm8p9dDyMI4pqgLtK67LEedpFPJChcGwGeIcGElw/k6UXf
V7Tt8jcq8hTrxRkclwSWVWXa5oPCMGUyF+ThhwxOpPQ2xFE0c+WamGF7uiQmrDPv
CnC4uEHTuYzA7Z9hwW92YSMFZFgt0wIw6bJDhg3VOnBjU3PEJJEE
-----END RSA PRIVATE KEY-----

Public key to connect to the nods

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCULpIB0QnF19e+xed3iHQQYy7GmHAoUtcICYRgYwH4YZe5TxJpbRhTV13o4dShw2seXyNTH9HlYIqruDQRwyS680lyqR1st+c/7SWrlB4/dSLPKpNLJ4QlVs3kjDtdVgkshQv6uI7jpEiq0/TTJDjfuyD8t2polzLWy1hqWHwCVgcj5Ha0tILvbcNvfFB2CUOSd4UhdhzK4enCiR84p0e2YGnH4KBZwx/seXo55LYHxniTTJGUnASVK9c/vSuSajC5RsOneNa5fgUngW/ZyctknaphjIMScRrTL+/a4kSNmQTQ44MIcQy3x07nnXSwcJBSt1oTpB1W8ds0XuSI52AB

###### Kube config
apiVersion: v1
kind: Config
clusters:
- name: "elastic"
  cluster:
    server: "https://35.198.68.69/k8s/clusters/c-q444s"
    certificate-authority-data: "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJpVENDQ\
      VM2Z0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQTdNUnd3R2dZRFZRUUtFeE5rZVc1aGJXbGoKY\
      kdsemRHVnVaWEl0YjNKbk1Sc3dHUVlEVlFRREV4SmtlVzVoYldsamJHbHpkR1Z1WlhJdFkyRXdIa\
      GNOTWpBeApNakUwTVRneE1UVTJXaGNOTXpBeE1qRXlNVGd4TVRVMldqQTdNUnd3R2dZRFZRUUtFe\
      E5rZVc1aGJXbGpiR2x6CmRHVnVaWEl0YjNKbk1Sc3dHUVlEVlFRREV4SmtlVzVoYldsamJHbHpkR\
      1Z1WlhJdFkyRXdXVEFUQmdjcWhrak8KUFFJQkJnZ3Foa2pPUFFNQkJ3TkNBQVQxWTFldUU5M1VNd\
      lAyYU54bHY1eHNFdVBOSnk0N3k3aHJsaTc4TlR0ZgpwSTJCWC9RT2JhRDhKK0JobVFzaWhRSExiU\
      VVhcU94VnlSMTA4TVpWNDI1d295TXdJVEFPQmdOVkhROEJBZjhFCkJBTUNBcVF3RHdZRFZSMFRBU\
      UgvQkFVd0F3RUIvekFLQmdncWhrak9QUVFEQWdOSkFEQkdBaUVBdWp1UFFxSXUKWmlpOHZQbGsrR\
      TROMDNCNUtzNm02eXE1a2hPcm5IZWpjTm9DSVFER0FKRGhlUGx0SGNzMVhBMDNrRk5ReDNROQpiU\
      kV6TDJYbmplWnZmVXlFZXc9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0t"

users:
- name: "elastic"
  user:
    token: "kubeconfig-user-dfff7:fxbb8576lvr628spdsj8v6jkxvw6xzhztsv7vs4nmcff56g72gj2mm"


contexts:
- name: "elastic"
  context:
    user: "elastic"
    cluster: "elastic"

current-context: "elastic"

### Elastic installation

helm3 upgrade elasticsearch elastic/elasticsearch -n elastic --install --set persistence.enabled=false --set resources.requests.cpu=250m --set resources.requests.memory=512m

helm3 upgrade kibana elastic/kibana -n elastic --install