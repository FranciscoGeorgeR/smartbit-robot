*** Settings ***
Documentation    Ações e elementos da pagina de boas vindas

Library    Browser

*** Keywords ***
verify welcome message
    Wait For Elements State    
    ...    text=Falta pouco para fazer parte da família Smartbit!    
    ...    visible    5