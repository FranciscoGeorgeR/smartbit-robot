*** Settings ***
Documentation    Cenarios de testes do login SAC

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve logar como Gestor da Academia
    Go to login page
    submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
           
Nao deve logar com senha incorreta
    [Tags]    inv_pass
    Go to login page   
    submit login form    sac@smartbit.com    123456       
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!

Nao deve logar com email não cadastrado
    [Tags]    inv_pass
    Go to login page   
    submit login form    404@smartbit.com    pwd123       
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!    

Tentativa de login com dados incorretos
    [Template]    Login with verify notice
     ${EMPTY}                    ${EMPTY}    Os campos email e senha são obrigatórios.
     ${EMPTY}                    pwd123      Os campos email e senha são obrigatórios.
     sac@smartbit.com            ${EMPTY}    Os campos email e senha são obrigatórios.
     wwwww.teste.com             pwd123      Oops! O email informado é inválido
     fdfsdfsdfsdfsdf             pwd123      Oops! O email informado é inválido
     12345678890-0-8             pwd123      Oops! O email informado é inválido
     @&¨@%@*¨@*¨@&¨*             pwd123      Oops! O email informado é inválido
     w6d4w6d4s6d6sd5             pwd123      Oops! O email informado é inválido
     teste$gmail.com             pwd123      Oops! O email informado é inválido

*** Keywords ***
Login with verify notice
    [Arguments]     ${email}    ${password}    ${output_message}
    Go to login page
    submit login form    ${email}    ${password}   
    Notice should be     ${output_message}
