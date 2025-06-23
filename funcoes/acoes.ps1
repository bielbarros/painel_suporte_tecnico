function Executar-Acoes {
    Write-Host "1. Limpar arquivos temporários"
    Write-Host "2. Encerrar processo"
    $acao = Read-Host "Escolha uma ação"
    switch ($acao) {
        "1" {
            try {
                $antes = (Get-ChildItem "$env:TEMP").Count
                Remove-Item "$env:TEMP\\*" -Recurse -Force -ErrorAction SilentlyContinue
                $depois = (Get-ChildItem "$env:TEMP").Count
                Write-Host "Arquivos temporários limpos! ($antes → $depois)"
            } catch {
                Write-Host "Erro ao limpar arquivos temporários: $_"
            }
        }
        "2" {
            $proc = Read-Host "Digite o nome do processo (ex: chrome)"
            Get-Process -Name $proc -ErrorAction SilentlyContinue | Stop-Process -Force
            Write-Host "Processo '$proc' encerrado."
        }
        default {
            Write-Host "Ação inválida."
        }
    }
}
Export-ModuleMember -Function Executar-Acoes
