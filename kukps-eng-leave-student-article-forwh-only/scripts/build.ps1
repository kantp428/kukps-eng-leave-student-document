[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$projectRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$engine = Get-Command xelatex -ErrorAction Stop
$outputDir = Join-Path $projectRoot 'build'
$fontFiles = @(
  'fonts/THSarabun/THSarabun.ttf',
  'fonts/THSarabun/THSarabun-Bold.ttf',
  'fonts/THSarabun/THSarabun-Italic.ttf',
  'fonts/THSarabun/THSarabun-BoldItalic.ttf',
  'fonts/JetBrainMono/JetBrainsMono-Regular.ttf',
  'fonts/JetBrainMono/JetBrainsMono-SemiBold.ttf',
  'fonts/JetBrainMono/JetBrainsMono-Italic.ttf',
  'fonts/JetBrainMono/JetBrainsMono-SemiBoldItalic.ttf'
)
foreach ($fontFile in $fontFiles) {
  if (-not (Test-Path -LiteralPath (Join-Path $projectRoot $fontFile) -PathType Leaf)) {
    throw "Missing font: $fontFile"
  }
}
New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
Push-Location $projectRoot
try {
  foreach ($pass in 1..2) {
    $compilerOutput = & $engine.Source '-synctex=1' '-interaction=nonstopmode' '-halt-on-error' '-file-line-error' '-recorder' '-output-directory=build' 'main.tex' 2>&1
    if ($LASTEXITCODE -ne 0) {
      $compilerOutput | Select-Object -Last 35 | Write-Output
      throw "XeLaTeX failed on pass $pass. See build/main.log."
    }
    Write-Output "XeLaTeX pass $pass succeeded."
  }
  $pdfFile = Join-Path $outputDir 'main.pdf'
  if (-not (Test-Path -LiteralPath $pdfFile -PathType Leaf)) { throw 'No PDF was produced.' }
  $warnings = Select-String -LiteralPath (Join-Path $outputDir 'main.log') -Pattern 'Overfull|Underfull|Missing character|undefined references|Citation .+ undefined|Rerun to get'
  if ($warnings) { $warnings | ForEach-Object { Write-Warning $_.Line } }
  Write-Output "PDF: $pdfFile"
} finally {
  Pop-Location
}
