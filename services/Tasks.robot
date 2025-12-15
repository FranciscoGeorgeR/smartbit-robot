*** Settings ***
Documentation    Arquivo para testar o consumo da API com tasks

Resource    ./Service.resource

*** Tasks ***
Testando API
    Set user token
    Get account by name    	Ze bryan    
