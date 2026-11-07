@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

echo ================================================
echo          MENTALISTA NEXUS
echo ================================================

if not exist "package.json" (
  echo ERRO: nao encontrei package.json nesta pasta.
  echo Extrai a pasta completa MENTALISTA_NEXUS antes de iniciar.
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
  echo A instalar as dependencias da aplicacao. Esta etapa so e necessaria na primeira vez...
  call "%NPM_CMD%" install
  if errorlevel 1 (
    echo ERRO: a instalacao das dependencias falhou.
    pause
    exit /b 1
  )
)

echo A iniciar o MENTALISTA NEXUS...
call "%NPM_CMD%" run dev -- --open
pause
