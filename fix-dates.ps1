# Fix date format in all markdown files
$files = Get-ChildItem -Path "content" -Filter "*.md" -Recurse

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $newContent = $content -replace 'date: "`r Sys\.Date\(\)`"', 'date: 2024-01-01'
    Set-Content -Path $file.FullName -Value $newContent -NoNewline
    Write-Host "Fixed: $($file.FullName)"
}

Write-Host "Done! Fixed $($files.Count) files"
