Write-Host "Starting Ollama..."

Start-Process ollama -ArgumentList "serve"

Start-Sleep -Seconds 3

Write-Host "Starting Next.js..."

npm run dev
