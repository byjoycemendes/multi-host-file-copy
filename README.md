# 📂 Cópia de Arquivo para Múltiplas Máquinas

Script criado para a **cópia de um arquivo `.bat` em diferentes máquinas** sem a necessidade de cópia manual.  
Ele automatiza tanto o **teste de disponibilidade** quanto a **cópia direta** em cada máquina.  

O funcionamento é separado em três pontos principais:  
1. **Lista de IPs** das máquinas (em arquivo `.txt`).  
2. **Caminho do arquivo a ser copiado** (ex.: `.bat`).  
3. **Destino generalizado** para todos os computadores.  

O destino escolhido no script é: \\$ip\c$\Users\Public\Desktop
Assim, o arquivo fica disponível para **diferentes usuários na máquina**.

---

## 🚀 Funcionamento
- Lê os IPs de um arquivo de texto.  
- Testa se cada máquina está acessível na rede.  
- Se disponível, copia o arquivo para o caminho de destino definido.  
- Exibe no console o resultado de cada operação.  

---

## ⚠️ Observações importantes
- **Variáveis configuráveis no script:**
  ```powershell
  $caminhoArquivoIPs = "origemListaIPs.txt"
  $arquivoOrigem     = "localDoArquivo.bat"
  $caminhoDestino    = "\\$ip\c$\Users\Public\Desktop"
  ```
- Para um bom funcionameto, é essencial considerar o uso de apontamentos utilizando o protocolo SMB.
  
---

## 📋 Pré-requisitos

- Windows PowerShell (ou PowerShell Core).
- Acesso administrativo às máquinas de destino.
- Permissões de rede para cópia de arquivos em c$\Users\Public\Desktop.
- Arquivo .txt contendo a lista de IPs das máquinas ou descrição dos IPs no script.

---

## ✅ Benefícios

- Automatiza a cópia de arquivos para múltiplas máquinas.
- Reduz tempo gasto em cópias manuais.
- Verifica a disponibilidade da máquina antes de tentar copiar.
- Garante que o arquivo fique acessível para diferentes usuários.

---

## ▶️ Como executar

- Ajuste as variáveis no script de acordo com sua necessidade.
- Salve o script, por exemplo, como copiaArquivos.ps1.

No PowerShell, rode:
```powershell
.\copiaArquivos.ps1
```
Note que antes do nome do script é preciso especificar o caminho da pasta ou abrir a pasta no respectivo terminal.


## 📌 Observações finais

Este script foi criado para uso interno em automações com máquinas variadas.  
Adapte conforme necessário para sua infraestrutura. Sugestões e melhorias são bem-vindas!  
Fique à vontade para abrir uma *issue* ou enviar um *pull request*.
