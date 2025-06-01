#!/bin/bash

echo "🚀 Deploying all AutoPort services..."

# Deploy backend
echo "⚙️ Deploying backend..."
cd autoport-backend
docker build -t autoport-backend .
docker push autoport-backend
cd ..

# Deploy Telegram bot
echo "🤖 Deploying Telegram bot..."
cd autoport-telegram
npm run deploy
cd ..

# Deploy Flutter app
echo "📱 Deploying Flutter app..."
cd autoport-mobile
flutter build web
# Add your deployment commands here
cd ..

echo "✅ All services deployed successfully!" 