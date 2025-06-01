#!/bin/bash

echo "🚀 Setting up AutoPort development environment..."

# Check prerequisites
command -v flutter >/dev/null 2>&1 || { echo "❌ Flutter is required but not installed. Please install Flutter first."; exit 1; }
command -v node >/dev/null 2>&1 || { echo "❌ Node.js is required but not installed. Please install Node.js first."; exit 1; }
command -v python3 >/dev/null 2>&1 || { echo "❌ Python 3 is required but not installed. Please install Python 3 first."; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "❌ Docker is required but not installed. Please install Docker first."; exit 1; }

# Setup Flutter mobile app
echo "📱 Setting up Flutter mobile app..."
cd autoport-mobile
flutter pub get
cd ..

# Setup Telegram mini app
echo "🤖 Setting up Telegram mini app..."
cd autoport-telegram
npm install
cd ..

# Setup Backend
echo "⚙️ Setting up Backend..."
cd autoport-backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cd ..

echo "✅ Setup completed successfully!" 