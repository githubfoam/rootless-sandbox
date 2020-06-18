IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

usernetes-containerd:
	bash scripts/usernetes-containerd.sh
usernetes-crio:
	bash scripts/usernetes-crio.sh
push-image:
	docker push $(IMAGE)
.PHONY: usernetes-containerd usernetes-crio push-image