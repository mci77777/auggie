$filePath = "C:\**\**\AppData\Roaming\npm\node_modules\@augmentcode\auggie\augment.mjs"
if (-not (Test-Path $filePath)) {
    Write-Error "错误：找不到文件 '$filePath'。请确认路径是否正确。"
    return
}
Copy-Item -Path $filePath -Destination "$filePath.bak" -Force
Write-Host "已成功创建备份文件: $filePath.bak"
(Get-Content -Path $filePath -Raw) -replace 'this\._userAgent=.*?;', 'this._userAgent="Augment.vscode-augment/0.521.0 (darwin; arm64; 24.5.0) vscode/1.102.3";' | Set-Content -Path $filePath -Encoding UTF8
Write-Host "成功修改文件: $filePath"
