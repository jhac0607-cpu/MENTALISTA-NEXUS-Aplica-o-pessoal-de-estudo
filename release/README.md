# MENTALISTA NEXUS 3.0

Aplicação web progressiva (PWA), em português de Portugal, com interface escura e dados guardados localmente no dispositivo.

## Instalar e iniciar no Windows

1. Instala o **Node.js LTS** a partir de https://nodejs.org/ (se ainda não estiver instalado).
2. Extrai o ZIP para uma pasta nova, por exemplo `C:\Users\O_TEU_UTILIZADOR\Downloads\MENTALISTA_NEXUS_3_0`.
3. Abre essa pasta e faz duplo clique em `INICIAR_MENTALISTA_NEXUS.bat`.
4. Na primeira execução, o ficheiro instala automaticamente as dependências. Depois abre o Mentalista no navegador.

Para iniciar manualmente no PowerShell:

```powershell
cd "$env:USERPROFILE\Downloads\MENTALISTA_NEXUS_3_0"
npm install
npm run dev -- --host 0.0.0.0 --open
```

O endereço no PC será normalmente `http://localhost:5173/`. Para parar, volta à janela preta e carrega em `Ctrl+C`.

## Módulos incluídos

- **Study Commander:** temporizador configurável (1 a 1440 minutos), pausa, reinício, registo de estudo no fim da sessão e registo manual, com histórico.
- **ElectroBox:** biblioteca pesquisável de fórmulas de Física, Matemática e Eletricidade; calculadora científica; Lei de Ohm; conversor de unidades e circuito DC resistivo didático.
- **Brain Arena:** desafios matemáticos renovados, sequências, memória, sopa de letras com vários temas e direções, quiz de Física e Estimativa Relâmpago. Os jogos geram novas rondas e perguntas.
- **Apontamentos:** escrita manual, fotografia/importação de imagens, OCR em português e inglês, edição, pesquisa e eliminação de apontamentos.
- **Evolução:** tempo total, sessões, gráfico semanal, disciplinas, hábitos e conquistas.
- **Página inicial:** os seis cartões de acesso rápido mantêm-se como entrada principal da aplicação.

## O que foi corrigido nos apontamentos

A versão anterior guardava imagens em Base64 dentro do `localStorage`. Esse armazenamento tem um limite reduzido e podia falhar quando se guardava uma fotografia. Nesta versão:

- Os apontamentos e as imagens são guardados em **IndexedDB**, adequado a volumes maiores de dados.
- As fotografias são reduzidas para um máximo de 1800 px e comprimidas antes de serem guardadas.
- A gravação, leitura e eliminação têm tratamento de erros para evitar que uma falha de armazenamento faça a aplicação fechar.
- Os apontamentos antigos em `nova-notes` são importados automaticamente quando possível; a chave antiga é removida depois de a migração ser concluída.
- Se o navegador não disponibilizar IndexedDB, existe uma alternativa que guarda texto sem imagens em `localStorage`, com um aviso visível.

## Dados e privacidade

Os apontamentos, imagens, hábitos e sessões ficam no armazenamento local do navegador. Não são sincronizados automaticamente entre PC e iPhone. Não limpes os dados do site nem uses a opção de limpar armazenamento do navegador sem exportar ou copiar primeiro os apontamentos importantes.

Ao migrares da versão anterior, abre primeiro a versão 3.0 no mesmo endereço do navegador (por exemplo, o mesmo `localhost`) para permitir a importação automática dos apontamentos antigos.

## iPhone / instalação como aplicação

Para instalar no ecrã principal do iPhone, publica a pasta compilada `dist` num alojamento estático com HTTPS. Abre o endereço no Safari do iPhone, toca em **Partilhar → Adicionar ao ecrã principal**. A instalação PWA exige HTTPS. O `localhost` do PC não é o endereço de instalação do iPhone.

Para testar a interface num iPhone e PC ligados à mesma rede Wi-Fi, a janela do Vite mostra também um endereço de rede. O acesso por IP local serve para testes; para instalação PWA, utiliza HTTPS.

## Compilar para publicação

```powershell
npm install
npm run build
```

O resultado fica na pasta `dist`.

## Limitações conhecidas

- O OCR pode precisar de Internet na primeira utilização para descarregar o motor e os dados linguísticos. O texto reconhecido deve ser revisto antes de ser guardado.
- A biblioteca de fórmulas serve como apoio ao estudo e não é exaustiva. Confirma sempre unidades, convenções e condições de aplicação.
- O circuito é um modelo didático ideal em corrente contínua; não substitui um simulador SPICE.
- O temporizador pode ser suspenso pelo iOS quando a aplicação fica em segundo plano.
