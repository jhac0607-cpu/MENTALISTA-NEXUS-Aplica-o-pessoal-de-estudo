# MENTALISTA NEXUS — atualização Brain Arena 2.1

Aplicação web progressiva (PWA), em português, com interface escura e dados guardados localmente no navegador.

## Instalação no Windows

1. Instala Node.js (versão LTS) a partir de https://nodejs.org/.
2. Extrai a pasta `MENTALISTA_NEXUS` para `C:\MENTALISTA_NEXUS`.
3. Faz duplo clique em `INICIAR_MENTALISTA_NEXUS.bat`.
4. Na primeira execução, o ficheiro instala as dependências. Depois inicia o Vite e abre o navegador.

Também podes executar manualmente no PowerShell:

```powershell
cd C:\MENTALISTA_NEXUS
& "C:\Program Files\nodejs\npm.cmd" install
& "C:\Program Files\nodejs\npm.cmd" run dev
```

Abre o endereço indicado pelo Vite (normalmente `http://localhost:5173/`). Para parar, regressa à janela do terminal e carrega em `Ctrl+C`.

## O que inclui

- **Study Commander:** temporizador de 25 minutos, registo de estudo no fim da sessão e registo manual. Em cada registo podes escolher a disciplina, escrever o tema e indicar a duração. Histórico de sessões e tempo por disciplina.
- **Evolução:** tempo total de estudo, sessões concluídas, minutos dos últimos sete dias, gráfico, disciplinas e hábitos. Não utiliza XP, níveis ou pontos. O gráfico apresenta uma indicação útil quando ainda não existem sessões.
- **ElectroBox:** biblioteca pesquisável com fórmulas de Física, Matemática e Eletricidade; calculadora com operações, potências, trigonometria em graus, raízes, logaritmos e constantes; calculadora da Lei de Ohm; conversor de massa, comprimento, volume, tempo, velocidade, área, energia, potência, pressão, temperatura, dados e força; circuito DC resistivo didático.
- **Brain Arena:** desafios matemáticos renovados, cinco tipos de sequências, memória com sequências que aumentam, sopa de letras com 12 temas e palavras em oito direções, quiz com 24 perguntas de Física sem repetição na ronda e Estimativa Relâmpago com 44 perguntas variadas por ronda. Cada jogo tem controlos para avançar ou criar novos desafios.
- **Notas:** escrita de apontamentos, anexação de fotografia e tentativa de OCR em português/inglês.

## Dados

Hábitos e apontamentos continuam a usar as chaves locais da versão anterior (`nova-habits` e `nova-notes`), para preservar o que já estava guardado nesse navegador. As sessões de estudo ficam em `nexus-study-sessions`. Os dados permanecem no dispositivo e não são sincronizados automaticamente entre PC e iPhone. Não limpes os dados do site sem exportar primeiro os apontamentos importantes.

## iPhone / PWA

Para instalar no ecrã principal do iPhone, publica a aplicação numa hospedagem estática HTTPS, abre o endereço no Safari e escolhe **Partilhar → Adicionar ao ecrã principal**. A instalação PWA exige HTTPS. O temporizador pode ser suspenso pelo iOS quando a aplicação fica em segundo plano.

## Limitações importantes

- A biblioteca de fórmulas é ampla para estudo geral, mas não é uma lista literalmente exaustiva de todas as fórmulas existentes. Confirma sempre unidades, convenções e condições de aplicação.
- A calculadora usa `%` como operador de resto (módulo), não como interpretação automática de percentagem financeira.
- O circuito é um modelo ideal simples em corrente contínua; não substitui um simulador SPICE.
- Na sopa de letras, seleciona as letras consecutivas pela grelha, incluindo diagonais e sentido inverso.
- O OCR pode precisar de Internet na primeira utilização para descarregar o motor e os dados linguísticos. Fórmulas e escrita manual devem ser revistas.


## Interface iPhone e instalação como aplicação

A versão 2.2 inclui um ecrã inicial em mosaicos coloridos, grelha adaptada a ecrãs pequenos, navegação inferior, áreas seguras do iPhone e metadados PWA/iOS.

Para testar no Windows: executar `INICIAR_MENTALISTA_NEXUS.bat` e abrir o endereço indicado.

Para instalar no iPhone: publicar a aplicação compilada (`npm run build`, pasta `dist`) num alojamento HTTPS. Depois abrir o endereço no Safari do iPhone, tocar em Partilhar e escolher “Adicionar ao ecrã principal”. A instalação PWA exige HTTPS; o endereço `localhost` do PC não funciona como endereço de instalação no iPhone.
