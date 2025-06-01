.PHONY: help setup start-all stop-all clean deploy

help:
	@echo "AutoPort Development Commands:"
	@echo "  setup      - Setup all projects"
	@echo "  start-all  - Start all services"
	@echo "  stop-all   - Stop all services"
	@echo "  clean      - Clean all builds"
	@echo "  deploy     - Deploy all platforms"

setup:
	@echo "🔧 Setting up AutoPort ecosystem..."
	cd autoport-mobile && flutter pub get
	cd autoport-telegram && npm install
	chmod +x scripts/*.sh

start-all:
	@echo "🚀 Starting all AutoPort services..."
	./scripts/start-all.sh

stop-all:
	docker-compose down

clean:
	cd autoport-mobile && flutter clean
	cd autoport-telegram && rm -rf node_modules
	cd autoport-backend && find . -name "*.pyc" -delete

deploy:
	./scripts/deploy-all.sh 