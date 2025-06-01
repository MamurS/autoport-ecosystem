# AutoPort Ecosystem

AutoPort is a comprehensive intercity ride-sharing platform for Uzbekistan, consisting of multiple applications and services.

## 🏗 Project Structure

- `autoport-backend/` - FastAPI backend service
- `autoport-mobile/` - Flutter mobile application
- `autoport-telegram/` - Telegram Mini App and Bot
- `autoport-shared/` - Shared resources and documentation

## 🚀 Quick Start

1. Clone the repository:
```bash
git clone https://github.com/your-org/autoport-ecosystem.git
cd autoport-ecosystem
```

2. Setup the development environment:
```bash
make setup
```

3. Start all services:
```bash
make start-all
```

## 📚 Documentation

- [API Documentation](autoport-shared/docs/api-specification.md)
- [Design System](autoport-shared/docs/design-system.md)
- [User Flows](autoport-shared/docs/user-flows.md)
- [Deployment Guide](autoport-shared/docs/deployment-guide.md)

## 🛠 Development

### Prerequisites

- Flutter SDK (>=3.10.0)
- Node.js (>=18.x)
- Python (>=3.8)
- Docker and Docker Compose

### Available Commands

- `make setup` - Setup all projects
- `make start-all` - Start all services
- `make stop-all` - Stop all services
- `make clean` - Clean all builds
- `make deploy` - Deploy all platforms

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details. 