# Fix date format in all markdown files
$files = Get-ChildItem -Path "content" -Filter "*.md" -Recurse

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    # Match various date formats with spaces
    $newContent = $content -replace 'date\s*:\s*"`r Sys\.Date\(\)`"', 'date: 2024-01-01'
    $newContent = $newContent -replace "date\s*:\s*'`r Sys\.Date\(\)`'", 'date: 2024-01-01'
    
    if ($content -ne $newContent) {
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
        Write-Host "Fixed: $($file.FullName)"
    }
}

Write-Host "Done! Processed $($files.Count) files"
