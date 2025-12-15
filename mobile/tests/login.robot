*** Settings ***
Documentation    Suite de testes de login

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve logar com o cpf e IP
    ${data}    Get JSON Fixture    login   

    Insert Membership        ${data} 
    
    Signin with Document    ${data}[account][cpf]
    User is logged in

Não deve logar com CPF não cadastrado
    
    Signin with Document    29308636099
    Popup have Text         Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com CPF com digito invalido
    
    Signin with Document    00000014144
    Popup have Text         CPF inválido, tente novamente


