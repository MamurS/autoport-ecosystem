#!/bin/bash

echo "🚀 Starting all AutoPort services..."

# Start backend
echo "⚙️ Starting backend..."
cd autoport-backend
source venv/bin/activate
uvicorn main:app --reload --port 8000 &
cd ..

# Start Telegram bot
echo "🤖 Starting Telegram bot..."
cd autoport-telegram
npm run dev &
cd ..

# Start Flutter app (development mode)
echo "📱 Starting Flutter app in development mode..."
cd autoport-mobile
flutter run -d chrome --web-port 3000 &
cd ..

echo "✅ All services started successfully!"
echo "🌐 Backend API: http://localhost:8000"
echo "🤖 Telegram Bot: Running"
echo "📱 Flutter Web: http://localhost:3000" 