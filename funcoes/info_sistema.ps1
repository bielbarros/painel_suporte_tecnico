$info = @{
    "Computador" = $env:COMPUTERNAME
    "Usuário" = $env:USERNAME
    "Versão do Windows" = (Get-CimInstance Win32_OperatingSystem).Caption
    "Modelo do PC" = (Get-CimInstance Win32_ComputerSystem).Model
}
return $info
