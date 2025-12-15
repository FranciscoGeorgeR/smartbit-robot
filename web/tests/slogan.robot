*** Settings ***
Documentation    Teste para verificar o Slogan da Smartbit web

Library   Browser

*** Test Cases ***
Deve mostrar o Slogan na Landing Page
    New Browser     browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text        css=.headline h2    equal    Sua Jornada Fitness Começa aqui!
    