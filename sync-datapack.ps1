# Define source and destination paths
$sourcePath = "C:\Users\maraw\OneDrive\Desktop\nations-minecraft-datapack"
$destinationPath = "C:\Users\maraw\AppData\Roaming\.minecraft\saves\New World (6)\datapacks\nations-minecraft-datapack"

# 1. Remove the existing folder at the destination to ensure a clean copy
if (Test-Path $destinationPath) {
    Remove-Item -Path $destinationPath -Recurse -Force
}

# 2. Copy the folder from Desktop to the Minecraft saves folder
Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse

# 3. Navigate to the destination to clean up unnecessary files
$gitFolder = Join-Path $destinationPath ".git"
$readmeFile = Join-Path $destinationPath "README.md"
$psFile = Join-Path $destinationPath "sync-datapack.ps1"

# Delete the .git folder if it exists
if (Test-Path $gitFolder) {
    Remove-Item -Path $gitFolder -Recurse -Force
}

# Delete the README.md file if it exists
if (Test-Path $readmeFile) {
    Remove-Item -Path $readmeFile -Force
}

# Delete the sync-datapack.ps1 file if it exists
if (Test-Path $psFile) {
    Remove-Item -Path $psFile -Force
}

Write-Host "Datapack synced and cleaned successfully!" -ForegroundColor Green