@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

echo ================================================
echo          MENTALISTA NEXUS 3.0
echo ================================================

echo.
if not exist "package.json" (
  echo ERRO: esta pasta nao contem package.json.
  echo Extrai o ZIP completo e executa este ficheiro na pasta MENTALISTA_NEXUS_3_0.
  pause
  exit /b 1
)

set "NPM_CMD="
for /f "delims=" %%N in ('where npm.cmd 2^>nul') do if not defined NPM_CMD set "NPM_CMD=%%N"
if not defined NPM_CMD if exist "C:\Program Files\nodejs\npm.cmd" set "NPM_CMD=C:\Program Files\nodejs\npm.cmd"
if not defined NPM_CMD if exist "%ProgramFiles%\nodejs\npm.cmd" set "NPM_CMD=%ProgramFiles%\nodejs\npm.cmd"

if not defined NPM_CMD (
  echo ERRO: nao encontrei npm.cmd.
  echo Instala o Node.js LTS em https://nodejs.org/ e volta a executar este ficheiro.
  pause
  exit /b 1
)

if not exist "node_modules\vite\bin\vite.js" (
  echo A instalar as dependencias. Esta etapa so e necessaria na primeira execucao.
  call "%NPM_CMD%" install
  if errorlevel 1 (
    echo.
    echo ERRO: a instalacao falhou. Confirma a ligacao a Internet e tenta novamente.
    pause
    exit /b 1
  )
)

echo.
echo A iniciar o MENTALISTA NEXUS 3.0...
echo Para parar a aplicacao, carrega em Ctrl+C nesta janela.
call "%NPM_CMD%" run dev -- --host 0.0.0.0 --open
pause
