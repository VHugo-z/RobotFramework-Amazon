*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Screenshot
Library    String
Library    Faker

*** Variables ***
${CAIXA_EMAIL}               //input[contains(@name,'email')]
${CAIXA_SENHA}               //input[contains(@name,'password')]
${CAIXA_NOME}                //input[contains(@name,'nome')]
${ENTRAR}                    //button[@data-testid='entrar'][contains(.,'Entrar')]
${CADASTRAR}                 //button[@data-testid='cadastrar'][contains(.,'Cadastrar')]
${CADASTRO}                  //a[@data-testid='cadastrar'][contains(.,'Cadastre-se')]
${CHECKBOX_ADMNISTRADOR}     //input[contains(@name,'administrador')]
${CAIXA_PRECO}               //input[contains(@name,'price')]
${CAIXA_DESCRICAO}           //textarea[contains(@name,'description')]
${CAIXA_QUANTIDADE}          //input[contains(@name,'quantity')]
${RELATORIO}                 //a[@data-testid='link-relatorios'][contains(.,'Relatórios')]

# ---------------------------------------------------------------------------------------------

${CADASTRAR_USUARIO}         //a[@data-testid='cadastrarUsuarios'][contains(.,'Cadastrar')]
${CLIQUE_CADASTRO}           //button[@data-testid='cadastrarUsuario'][contains(.,'Cadastrar')]
${CADASTRAR_PRODUTO}         //a[@data-testid='cadastrarProdutos'][contains(.,'Cadastrar')]
${BOTÃO_CADASTRAR_PRODUTO}   //button[@data-testid='cadastarProdutos'][contains(.,'Cadastrar')]


*** Keywords ***

Abrir o site
    Open Browser    browser=chrome
    Maximize Browser Window

    ${RANDOM_EMAIL_CADASTRO}            Generate Random String  length=8    chars=[LETTERS]
    ${NOME_CADASTRO}                    Generate Random String  length=5    chars=[LETTERS]
    ${SENHA_CADASTRO}                   Generate Random String  length=10
    ${PRECO_CADASTRO}                   Generate Random String  length=3    chars=[NUMBERS]
    ${QUANTIDADE_PRODUTO_CADASTRO}       Generate Random String  length=2    chars=[NUMBERS]
    Set Test Variable           ${QUANTIDADE_PRODUTO}  ${QUANTIDADE_PRODUTO_CADASTRO}  
    Set Test Variable           ${PRECO}               ${PRECO_CADASTRO}
    Set test Variable           ${NOME}                ${NOME_CADASTRO}
    Set test Variable           ${SENHA}               ${SENHA_CADASTRO}
    Set test Variable           ${RANDOM_EMAIL}        ${RANDOM_EMAIL_CADASTRO}

Fechar o site
    Capture Page Screenshot
    Close Browser

Dado que eu estou no site "${SITE}"
    Go To    url=${SITE}
    Wait Until Page Contains    text=Login

Quando digitar as informações
    Input Text    locator=${CAIXA_EMAIL}    text=${RANDOM_EMAIL}@gmail.com

    Input Password    locator=${CAIXA_SENHA}    password=${SENHA}

E clicar em entrar
    Click Element    locator=${ENTRAR}

Quando clicar em Cadastrar-se
    Click Element    locator=${CADASTRO}
    Wait Until Page Contains    text=Cadastro

E preencher as informações com administrador
    Input Text    locator=${CAIXA_NOME}     text=${NOME}
    Input Text    locator=${CAIXA_EMAIL}    text=${RANDOM_EMAIL}@gmail.com
    Input Text    locator=${CAIXA_SENHA}    text=${SENHA}

    Select Checkbox    locator=${CHECKBOX_ADMNISTRADOR}

E clico em Cadastrar
    Click Element    locator=${CADASTRAR}

Quando digitar o email
    Input Text    locator=${CAIXA_EMAIL}    text=${RANDOM_EMAIL}@gmail.com

Então deverá aparecer "${TEXTO_OBRIGATORIO}"
    Wait Until Page Contains    text=${TEXTO_OBRIGATORIO}

Quando digitar a senha
    Input Password    locator=${CAIXA_SENHA}    password=${SENHA}

E preencher o email e senha com administrador
    Input Text    locator=${CAIXA_EMAIL}    text=${RANDOM_EMAIL}@gmail.com
    Input Text    locator=${CAIXA_SENHA}    text=${SENHA}

    Select Checkbox    locator=${CHECKBOX_ADMNISTRADOR}

E preencher o nome e senha com admnistrador
    Input Text    locator=${CAIXA_NOME}     text=${NOME}
    Input Text    locator=${CAIXA_SENHA}    text=${SENHA}

    Select Checkbox    locator=${CHECKBOX_ADMNISTRADOR}

 E preencher o nome e email com admnistrador
     Input Text    locator=${CAIXA_NOME}     text=${NOME}
     Input Text    locator=${CAIXA_EMAIL}    text=${RANDOM_EMAIL}@gmail.com

     Select Checkbox    locator=${CHECKBOX_ADMNISTRADOR}

E entro na conta
    Input Text    locator=${CAIXA_EMAIL}    text=vh@gmail.com
    Input Password    locator=${CAIXA_SENHA}    password=ppwx

    E clicar em entrar
    Wait Until Page Contains    text=Este é seu sistema para administrar seu ecommerce.

E clico em cadastrar usuários
  Click Element    locator=${CADASTRAR_USUARIO}
  

Quando preencho as informações necessárias
    E preencher as informações com administrador

Então deverá aparecer a lista dos usuários
    Wait Until Page Contains Element    locator=//table[contains(@class,'table table-striped')]

E clico em cadastrar usuários com admnistrador
    Click Button    locator=${CLIQUE_CADASTRO}

E clico em cadastrar Produtos
    Click Element    locator=${CADASTRAR_PRODUTO}
    Wait Until Page Contains    text=Cadastro de Produtos

Quando preencho as informações de produto
    Input Text    locator=${CAIXA_NOME}          text=${NOME}
    Input Text    locator=${CAIXA_PRECO}         text=${PRECO}
    Input Text    locator=${CAIXA_DESCRICAO}     text=Produto teste
    Input Text    locator=${CAIXA_QUANTIDADE}    text=${QUANTIDADE_PRODUTO}
    

E clico em cadastrar produto
    Click Element    locator=${BOTÃO_CADASTRAR_PRODUTO}



Então deverá aparecer a lista dos produtos
    Wait Until Page Contains    text=Lista dos Produtos

Quando clico em Relatórios
    Click Element    locator=${RELATORIO}

Entao deverá aparecer Em construção aguarde
    Page Should Contain    text=Em construção aguarde
    
    