Detalhamento: 

>> Script criado para a cópia de um arquivo bat em diferentes máquinas sem cópia manual, mas automatizando tanto o teste de disponibilidade quanto a cópia direta em cada máquina. Para isso, ele é separado no script e na lista de IPs das máquinas, além do caminho do arquivo em si. 

>> O destino generalizado escolhido para o arquivo foi em c$\Users\Public\Desktop para visualização geral de diferentes usuários na máquina. 

>> As variáveis que podem ser alteradas são:
$caminhoArquivoIPs = origemListaIPs;
$arquivoOrigem = localDoArquivo;
$caminhoDestino = destinoGeneralizado.

>> Erros como "Copy-Item : Acesso negado [...]" podem apontar um caso à parte da indisponibilidade da rede ou cópia executada, não completando a operação por falta de acesso usual.

--

# Caminho do arquivo contendo a lista dos IPs numa máquina piloto
$caminhoArquivoIPs = "C:\Users\jraianne\OneDrive - Globo Comunicação e Participações sa\Documentos\ARQUIVO SDR ILHAS\Lista de IPs.txt"

# Verificar se o arquivo de IPs existe
if (Test-Path $caminhoArquivoIPs) {
    # Lê os IPs do arquivo
    $ips = Get-Content $caminhoArquivoIPs

    # Caminho de origem do arquivo a ser copiado para as maquinas
    $arquivoOrigem = "\\cpp-ml-hp.servicos.corp.tvglobo.com.br\SUPORTE\SASP\SRD_mount.bat"

    # Laço para cada IP incluso na lista
    foreach ($ip in $ips) {
        # Caminho de destino generalizado nas máquinas
        $caminhoDestino = "\\$ip\c$\Users\Public\Desktop"

        # Testa se a máquina está acessível
        if (Test-Connection -ComputerName $ip -Count 1 -Quiet) {
            # Copia o arquivo para a máquina
            Copy-Item $arquivoOrigem -Destination $caminhoDestino -Force
            Write-Host "Arquivo copiado para $ip em $caminhoDestino"
        } else {
            Write-Host "Não foi possível conectar a $ip. Verifique se a máquina está disponível na rede."
        }
    }
} else {
    Write-Host "O arquivo de IPs não foi encontrado em $caminhoArquivoIPs."
}
