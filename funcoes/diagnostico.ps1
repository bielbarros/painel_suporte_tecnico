function Get-Diagnostico {
    $discos = Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name, Used, Free
    $ping = Test-Connection -ComputerName google.com -Count 2 -Quiet
    $antivirus = Get-CimInstance -Namespace root\\SecurityCenter2 -ClassName AntivirusProduct | Select-Object displayName, productState

    $resultado = @{
        "Discos" = $discos
        "Internet Ativa" = $ping
        "Antivírus" = $antivirus
    }
    return $resultado
}
Export-ModuleMember -Function Get-Diagnostico
