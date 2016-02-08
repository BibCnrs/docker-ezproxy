build:
	docker build -t bibcnrs/ezproxy --build-arg http_proxy --build-arg https_proxy .

cleanup-docker:
	test -z "$$(docker ps -a | grep dockerezproxy_ezproxy_1)" || \
        docker rm --force $$(docker ps -a | grep dockerezproxy_ezproxy_1 | awk '{ print $$1 }')
	test -z "$$(docker ps -a | grep dockerezproxy_dnsmasq_1)" || \
            docker rm --force $$(docker ps -a | grep dockerezproxy_ezproxy_1 | awk '{ print $$1 }')
