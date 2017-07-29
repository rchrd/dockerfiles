.PHONY: build push

build:
	@git clone https://github.com/kylemanna/docker-openvpn.git

	@echo "Create Dockerfile for RPi2"
	@cp docker-openvpn/Dockerfile.aarch64 docker-openvpn/Dockerfile.armhfp
	@sed -i '' 's_aarch64/alpine:3.5_arm32v6/alpine:3.5_g' docker-openvpn/Dockerfile.armhfp

	docker build -t rchrd/rpi-openvpn -f ./docker-openvpn/Dockerfile.armhfp ./docker-openvpn

	@echo "Remove docker-openvpn git repo"
	@rm -rf docker-openvpn

push:
	docker push rchrd/rpi-openvpn
