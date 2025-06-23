function Get-Diagnostico {
    $discos = Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name, Used, Free
    $ping = Test-Connection -ComputerName google.com -Count 2 -Quiet
    $antivirus = Get-CimInstance -Namespace root\\SecurityCenter2 -ClassName AntivirusProduct | Select-Object displayName, productState
    $memoria = Get-CimInstance Win32_OperatingSystem | Select-Object @{Name='Memória Total (MB)';Expression={[math]::Round($_.TotalVisibleMemorySize / 1024, 2)}},
                                                                          @{Name='Memória Livre (MB)';Expression={[math]::Round($_.FreePhysicalMemory / 1024, 2)}}


    $resultado = @{
        "Discos" = $discos
        "Internet Ativa" = $ping
        "Antivírus" = $antivirus
        "Memória RAM" = $memoria

    }
    return $resultado
}
Export-ModuleMember -Function Get-Diagnostico
