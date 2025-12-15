*** Settings ***
Documentation    Cenarios de testes de adesões de planos 

Resource    ../resources/Base.resource


Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão
    ${data}    Get Fixture    memberships    create
    
    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]   
    
    SignIn Admin 
    Go to memberships
    Create new mombership    ${data}   
    Toast should be    Matrícula cadastrada com sucesso.    

Não deve realizar adesão duplicada
    ${data}    Get Fixture    memberships    duplicate
    
    Insert Membership        ${data}

    SignIn Admin 
    Go to memberships 
    Create new mombership    ${data}  
    Toast should be    O usuário já possui matrícula.  

Deve pesquisar por nome
    [Tags]    search

    ${data}    Get Fixture    memberships    search
    
    Insert Membership        ${data}

    SignIn Admin 
    Go to memberships
    
    Search by name           ${data}[account][name]    
    should filter by name    ${data}[account][name] 
    
 Deve excluir uma matricula
     [Tags]    remove

    ${data}    Get Fixture    memberships    remove
    
    Insert Membership        ${data}

    SignIn Admin 
    Go to memberships 

    Request removal                     ${data}[account][name]
    Confirm Removal
    Menbership should not be visible    ${data}[account][name]