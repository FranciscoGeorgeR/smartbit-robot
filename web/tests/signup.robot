*** Settings ***
Documentation    Cenarios de testes de pré-cadastro de clientes

Resource    ../resources/Base.resource  

Test Setup        Start session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente
    ${account}      Create Dictionary
    ...            name=Chico da Silva
    ...            email=chicodasilva@teste.com
    ...            cpf=55494785017

    Delete Account By Email    ${account}[email]
    
    Submit signup form    ${account}
    verify welcome message

Tentativa de pré-cadastro
    [Template]        Attempt signup
    ${EMPTY}          chicodasilva@teste.com    55494785017    Por favor informe o seu nome completo              
    Chico da Silva    ${EMPTY}                  55494785017    Por favor, informe o seu melhor e-mail
    Chico da Silva    chicodasilva@teste.com    ${EMPTY}       Por favor, informe o seu CPF      
    Chico da Silva    chicodasilva$teste.com    55494785017    Oops! O email informado é inválido
    Chico da Silva    chicodasilva!teste.com    55494785017    Oops! O email informado é inválido
    Chico da Silva    chicodasilva*teste.com    55494785017    Oops! O email informado é inválido
    Chico da Silva    www.google.com            55494785017    Oops! O email informado é inválido
    Chico da Silva    chicodateste.com          55494785017    Oops! O email informado é inválido
    Chico da Silva    chicodasilva@teste.com    5549478501a    Oops! O CPF informado é inválido
    Chico da Silva    chicodasilva@teste.com    &¨%#*#         Oops! O CPF informado é inválido
    Chico da Silva    chicodasilva@teste.com    55494          Oops! O CPF informado é inválido
    Chico da Silva    chicodasilva@teste.com    554947850      Oops! O CPF informado é inválido
    Chico da Silva    chicodasilva@teste.com    5549478@@@@    Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...        name=${name}
    ...        email=${email}
    ...        cpf=${cpf}

    Submit signup form    ${account}
    Notice should be      ${output_message} 

    
