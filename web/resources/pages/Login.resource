*** Settings ***
Documentation    Ações e elementos da pagina de login

Variables    ../Env.py

Library    Browser

*** Keywords ***

Go to login page
    Go To    ${BASE_URL}/login

submit login form
    [Arguments]    ${email}    ${password}

    Fill Text    css=input[name=email]       ${email}    
    Fill Text    css=input[name=password]    ${password}
    Click        css=button >> text=Entrar

