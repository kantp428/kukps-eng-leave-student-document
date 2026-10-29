$ErrorActionPreference = 'Stop'
$posterRoot = Split-Path -Parent $PSScriptRoot
Push-Location -LiteralPath $posterRoot
try {
    New-Item -ItemType Directory -Path 'build' -Force | Out-Null
    for ($pass = 1; $pass -le 2; $pass++) {
        & xelatex '-interaction=nonstopmode' '-halt-on-error' '-file-line-error' '-output-directory=build' 'main.tex'
        if ($LASTEXITCODE -ne 0) { throw 'XeLaTeX failed. See build/main.log.' }
    }
    Copy-Item -LiteralPath 'build/main.pdf' -Destination 'poster-a4.pdf' -Force
    Write-Host "PDF: $(Join-Path $posterRoot 'poster-a4.pdf')"
}
finally { Pop-Location }
