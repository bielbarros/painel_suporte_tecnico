# painel.ps1 - Painel de Suporte Técnico

Import-Module -Name "$PSScriptRoot/funcoes/info_sistema.ps1" -Force
Import-Module -Name "$PSScriptRoot/funcoes/diagnostico.ps1" -Force
Import-Module -Name "$PSScriptRoot/funcoes/acoes.ps1" -Force
Import-Module -Name "$PSScriptRoot/funcoes/gerar_log.ps1" -Force

function Mostrar-Menu {
    Clear-Host
    Write-Host "===== Painel de Suporte Técnico =====" -ForegroundColor Cyan
    Write-Host "1. Mostrar informações do sistema"
    Write-Host "2. Executar diagnóstico"
    Write-Host "3. Executar ações (limpeza, encerrar processos)"
    Write-Host "4. Gerar log completo"
    Write-Host "0. Sair"
    $opcao = Read-Host "Escolha uma opção"
    return $opcao
}

do {
    $escolha = Mostrar-Menu

    switch ($escolha) {
        "1" { Get-InfoSistema | Format-List; Pause }
        "2" { Get-Diagnostico | Format-List; Pause }
        "3" { Executar-Acoes; Pause }
        "4" { Gerar-Log; Pause }
        "0" { Write-Host "Saindo..." }
        default { Write-Host "Opção inválida!"; Pause }
    }
} while ($escolha -ne "0")
