@echo off

start "" ollama serve

timeout /t 5 >nul

cd /d D:\Fitpilot\FitCopilotAI\fitcopilot-ai

npm run dev