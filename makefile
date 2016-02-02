build:
	docker build -t bibcnrs/ezproxy --build-arg http_proxy --build-arg https_proxy .
