# EP01 비주얼 렌더 — build/*.html → visuals/<name>.png (1920x1080)
# 사용법:  powershell -File render.ps1            (전체)
#          powershell -File render.ps1 s03 s07    (지정 씬만)
param([string[]]$only)
$ErrorActionPreference='Continue'
$build = $PSScriptRoot
$out   = Split-Path $build -Parent
$chrome= "C:\Program Files\Google\Chrome\Application\chrome.exe"
if(-not (Test-Path $chrome)){ $chrome="C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" }
$files = Get-ChildItem $build -Filter *.html
if($only){ $files = $files | Where-Object { $only -contains $_.BaseName } }
foreach($f in $files){
  $png = Join-Path $out ($f.BaseName + ".png")
  $url = "file:///" + ($f.FullName -replace '\\','/')
  $prof = Join-Path $env:TEMP ("chrome_shot_" + [guid]::NewGuid().ToString("N"))
  $a = @("--headless","--disable-gpu","--no-sandbox","--hide-scrollbars",
         "--user-data-dir=$prof","--no-first-run","--no-default-browser-check",
         "--force-device-scale-factor=1","--window-size=1920,1080",
         "--virtual-time-budget=3000","--screenshot=$png",$url)
  $p = Start-Process -FilePath $chrome -ArgumentList $a -NoNewWindow -Wait -PassThru
  if(Test-Path $png){ "OK  {0}  ({1} KB)" -f $f.BaseName,[int]((Get-Item $png).Length/1KB) }
  else { "FAIL $($f.BaseName) exit=$($p.ExitCode)" }
}
