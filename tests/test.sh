#!/bin/bash

echo "Running health check test..."

# Start app in background
python app/app.py &
APP_PID=$!

sleep 3

code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/health)

if [ "$code" -eq 200 ]; then
  echo "✅ Test Passed"
  kill $APP_PID
  exit 0
else
  echo "❌ Test Failed"
  kill $APP_PID
  exit 1
fi