@echo off
REM === NASAZENI NA GITHUB PAGES ===
echo.
echo Pro nasazeni potrebujes GitHub ucet (zdarma na github.com)
echo.
set /p GH_USER="Zadej GitHub uzivatelske jmeno: "
set /p GH_TOKEN="Zadej GitHub Personal Access Token (klasicky, repo scope): "
echo.
echo Vytvarim repo...
curl -s -u %GH_USER%:%GH_TOKEN% -X POST https://api.github.com/user/repos -H "Content-Type: application/json" -d "{\"name\":\"idelnicek\",\"description\":\"Studijni materialy pro stredoskolaky\",\"auto_init\":false}" > nul
echo.
echo Pridavam remote...
git remote add origin https://%GH_USER%:%GH_TOKEN%@github.com/%GH_USER%/idelnicek.git
echo.
echo Pushuji na GitHub...
git push -u origin master
echo.
echo Aktivuji GitHub Pages...
curl -s -u %GH_USER%:%GH_TOKEN% -X POST https://api.github.com/repos/%GH_USER%/idelnicek/pages -H "Content-Type: application/json" -d "{\"source\":{\"branch\":\"master\",\"path\":\"/\"}}" > nul
echo.
echo Hotovo! Web bude za par minut na:
echo https://%GH_USER%.github.io/idelnicek/
pause
