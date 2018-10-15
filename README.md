# ArecoTeste
Avaliação para vaga de Analista

Instruções para instalação do ArecoTeste:

Se na máquina a ser instalado o banco de dados FIREBIRD estiver instalado, seguir o seguintes passos:

1. Criar um diretório chamado C:\ArecoTeste;
2. Copiar para dentro desse diretório os seguintes arquivos e pasta baixados do GitHub:
   - Config.ini;
   - FBCLIENT.dll
   - gds32.dll
   - prjArecoTeste.exe
   - e a pasta BancoDados, onde está localizado o banco para ser usado pela aplicação.
3. Depois de ter feito a cópia, abrir o arquivo CONFIG.INI, que está localizado em C:\ArecoTeste, e alterar o seguinte parâmetro:
   - onde está escrito DATABASE, colocar o caminho onde está o arquivo de Banco de Dados copiado, por exemplo:
     DATABASE=C:\ArecoTeste\BancoDados\MAYKEL.FDB
4. Abrir o Windows Explorer, (tecla do windows do teclado+E), acessar o diretório C:\, escolher a pasta ArecoTeste clicando e entrando na mesma, e depois dar dois cliques no arquivo prjArecoTeste.exe, onde abrirá a aplicação.
   
Se na máquina a ser instalado o banco de dados FIREBIRD NÃO estiver instalado, seguir o seguintes passos:

1. Criar um diretório chamado C:\ArecoTeste;
2. Copiar para dentro desse diretório os seguintes arquivos e pasta baixados do GitHub:
   - Config.ini;
   - FBCLIENT.dll
   - gds32.dll
   - prjArecoTeste.exe
   - e a pasta BancoDados, onde está localizado o banco para ser usado pela aplicação.
3. Depois de ter feito a cópia, abrir o arquivo CONFIG.INI, que está localizado em C:\ArecoTeste, e alterar o seguinte parâmetro:
   - onde está escrito DATABASE, colocar o caminho onde está o arquivo de Banco de Dados copiado, por exemplo:
     DATABASE=C:\ArecoTeste\BancoDados\MAYKEL.FDB
4. Descompactar o arquivo Firebird-3.0.4.33054_0_x64.rar baixado, onde o mesmo extrairá o arquivo Firebird-3.0.4.33054_0_x64.exe, que é um instalador do Banco de dados Firebird. Seguir as definições padrões para instalação sugerida através do instalador, e quando chegar na tela do usuário e senha, anotar o usuário e senha configurado.
5. Depois da instalação do banco de dados, abrir novamente o arquivo CONFIG.INI, localizado na pasta criada C:\ArecoTeste, e alterar o seguinte parâmetro:
   - onde está escrito DATABASE, colocar o caminho onde está o arquivo de Banco de Dados copiado, por exemplo:
     USERNAME=usuário configurado
     PASSWORD=senha configurada
6. Abrir o Windows Explorer, (tecla do windows do teclado+E), acessar o diretório C:\, escolher a pasta ArecoTeste clicando e entrando na mesma, e depois dar dois cliques no arquivo prjArecoTeste.exe, onde abrirá a aplicação.
   
