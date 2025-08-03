# auggie
auggie-quick start for windows

npm install -g @augmentcode/auggie
auggie -login
使用 下面 ps1 脚本
替换你的 mjs 位置然后运行
打开 powershell 管理员 运行

1. 直接指定包含核心代码的 .mjs 文件路径
$filePath = “C:**\augment.mjs”

2. 检查文件是否存在，如果不存在就报错
if (-not (Test-Path $filePath)) {
Write-Error “错误：找不到文件 ‘$filePath’。请确认路径是否正确。”
return
}

3. 创建备份 (会生成一个 augment.mjs.bak 文件)
Copy-Item -Path $filePath -Destination “$filePath.bak” -Force
Write-Host “已成功创建备份文件: $filePath.bak”

4. 读取、替换并写回正确的文件
(Get-Content -Path $filePath -Raw) -replace ‘this._userAgent=.*?;’, ‘this._userAgent=“Augment.vscode-augment/0.521.0 (darwin; arm64; 24.5.0) vscode/1.102.3”;’ | Set-Content -Path $filePath -Encoding UTF8
Write-Host “成功修改文件: $filePath”
