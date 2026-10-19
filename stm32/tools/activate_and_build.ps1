param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("task3", "task4")]
    [string]$Task
)

$ErrorActionPreference = "Stop"

$stm32Dir = Split-Path -Parent $PSScriptRoot
$labRoot = Split-Path -Parent $stm32Dir
$documentsDir = Split-Path -Parent $labRoot
$eceRoot = Join-Path $documentsDir "ece2_474"
$activeSource = Join-Path $eceRoot "Core\Src\ece2_474_routine.c"
$buildDir = Join-Path $eceRoot "build\Debug"

if ($Task -eq "task3") {
    $template = Join-Path $stm32Dir "task3_interrupt_led\ece2_474_routine.c"
    $prebuiltDir = Join-Path $stm32Dir "prebuilt\task3"
    $elfName = "ece2_474_task3_debug.elf"
} else {
    $template = Join-Path $stm32Dir "task4_pwm_duty\ece2_474_routine.c"
    $prebuiltDir = Join-Path $stm32Dir "prebuilt\task4"
    $elfName = "ece2_474_task4_debug.elf"
}

foreach ($required in @($template, $activeSource, $buildDir)) {
    if (-not (Test-Path -LiteralPath $required)) {
        throw "Required path not found: $required"
    }
}

$backupDir = Join-Path $eceRoot "lab5_backup\before_first_lab5_switch"
$backupFile = Join-Path $backupDir "ece2_474_routine.c"
if (-not (Test-Path -LiteralPath $backupFile)) {
    New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
    Copy-Item -LiteralPath $activeSource -Destination $backupFile
    $backupHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $backupFile).Hash
    @(
        "Original active file backup before LAB5 task switching"
        "Source: $activeSource"
        "SHA256: $backupHash"
    ) | Set-Content -LiteralPath (Join-Path $backupDir "BACKUP_INFO.txt") -Encoding utf8
}

Copy-Item -LiteralPath $template -Destination $activeSource -Force
(Get-Item -LiteralPath $activeSource).LastWriteTime = Get-Date

$cmake = Get-ChildItem -Path (Join-Path $env:LOCALAPPDATA "stm32cube\bundles\cmake\*\bin\cmake.exe") -File |
    Sort-Object FullName -Descending |
    Select-Object -First 1
if ($null -eq $cmake) {
    throw "STM32Cube bundled CMake was not found."
}

Write-Host "Activating $Task and building Debug firmware..." -ForegroundColor Cyan
& $cmake.FullName --build $buildDir --target ece2_474 --parallel
if ($LASTEXITCODE -ne 0) {
    throw "STM32 build failed with exit code $LASTEXITCODE"
}

$elf = Join-Path $buildDir "ece2_474.elf"
if (-not (Test-Path -LiteralPath $elf)) {
    throw "Build completed without the expected ELF: $elf"
}

New-Item -ItemType Directory -Path $prebuiltDir -Force | Out-Null
Copy-Item -LiteralPath $elf -Destination (Join-Path $prebuiltDir $elfName) -Force

$sourceHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $activeSource).Hash
$elfHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $elf).Hash
Write-Host "SUCCESS: $Task is active." -ForegroundColor Green
Write-Host "Source SHA256: $sourceHash"
Write-Host "ELF SHA256:    $elfHash"
Write-Host "ELF: $elf"
Write-Host "Use F5 in the ece2_474 workspace to download it to the board."
