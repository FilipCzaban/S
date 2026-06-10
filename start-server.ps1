# MotoSektory – lokalni HTTP server (PowerShell .NET)
# Spust: pravym klikem -> "Run with PowerShell"

$port = 8080
$root = $PSScriptRoot

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()

Write-Host ""
Write-Host "  MotoSektory server bezi!" -ForegroundColor Green
Write-Host "  Otevri v prohlizeci: http://localhost:$port" -ForegroundColor Cyan
Write-Host "  GPS funguje na localhost bez HTTPS." -ForegroundColor Yellow
Write-Host "  Pro zastaveni stiskni CTRL+C" -ForegroundColor Gray
Write-Host ""

# Otevrit prohlizec
Start-Process "http://localhost:$port"

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".json" = "application/json"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".woff2"= "font/woff2"
}

while ($listener.IsListening) {
    try {
        $ctx      = $listener.GetContext()
        $req      = $ctx.Request
        $resp     = $ctx.Response

        $urlPath  = $req.Url.AbsolutePath
        if ($urlPath -eq "/" -or $urlPath -eq "") { $urlPath = "/index.html" }

        $filePath = Join-Path $root $urlPath.TrimStart("/").Replace("/", "\")

        if (Test-Path $filePath -PathType Leaf) {
            $ext  = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $resp.ContentType   = $mime
            $resp.ContentLength64 = $bytes.Length
            $resp.StatusCode    = 200
            $resp.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            # Fallback -> index.html (SPA)
            $filePath = Join-Path $root "index.html"
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $resp.ContentType   = "text/html; charset=utf-8"
            $resp.ContentLength64 = $bytes.Length
            $resp.StatusCode    = 200
            $resp.OutputStream.Write($bytes, 0, $bytes.Length)
        }

        $resp.OutputStream.Close()
    }
    catch {
        # Ignore listener closed error on CTRL+C
        if ($listener.IsListening) { Write-Host "Chyba: $_" -ForegroundColor Red }
    }
}
