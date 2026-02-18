# makefile_nginx.mk
# Nginx commands

.PHONY: nginx-shell nginx-reload test

nginx-shell:
	$(DC_BIN) exec nginx sh

nginx-reload:
	$(DC_BIN) exec nginx nginx -s reload

test:
	@echo "Starting nginx..."
	$(DC_BIN) up -d
	@echo "Waiting for healthcheck..."
	@for i in 1 2 3 4 5; do \
		curl -sf http://localhost:8080/ >/dev/null 2>&1 && break || sleep 2; \
	done
	@echo "Test HTTP 200..."
	curl -sf -o /dev/null -w "%{http_code}" http://localhost:8080/ | grep -q 200 && echo "PASS: HTTP 200" || (echo "FAIL: HTTP 200" && exit 1)
	@echo ""
	@echo "All tests passed!"
