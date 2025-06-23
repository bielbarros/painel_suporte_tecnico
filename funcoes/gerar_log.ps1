function Gerar-Log {
    $info = Get-InfoSistema
    $diag = Get-Diagnostico
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $logPath = "$PSScriptRoot/../logs/log_$timestamp.txt"

    $log = "=== Relatório de Diagnóstico - $timestamp ===`n"
    $log += "`n--- Informações do Sistema ---`n"
    $info.GetEnumerator() | ForEach-Object { $log += "$($_.Key): $($_.Value)`n" }

    $log += "`n--- Diagnóstico ---`n"
    $log += "Internet Ativa: $($diag['Internet Ativa'])`n"

    $log += "`nDiscos:`n"
    foreach ($d in $diag["Discos"]) {
        $log += " - $($d.Name): $([math]::Round($d.Used/1MB,2))MB usados, $([math]::Round($d.Free/1MB,2))MB livres`n"
    }

    $log += "`nAntivírus:`n"
    foreach ($av in $diag["Antivírus"]) {
        $log += " - $($av.displayName): Estado $($av.productState)`n"
    }

    $log | Out-File -FilePath $logPath -Encoding UTF8
    Write-Host "Log gerado em: $logPath"
}
Export-ModuleMember -Function Gerar-Log
