*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${BROWSER}                   chrome
${URL}                       https://amazon.com.br
${MENU_LIVROS}               //a[contains(.,'Livros')]
${HEADER_LIVROS}             //h2[contains(.,'Loja de Livros')]
${ELEMENT}                   //li[contains(@class,'sl-sobe-carousel-sub-card celwidget csm-placement-id-35dcfecf-9720-4df1-bc96-90b1c62e4ca9_1 csm-widget-ref-fd21_1 csm-pageid-6740748011 csm-widget-type-horizontaleditorial-tile csm-widget-tile-1')]
${BARRA_DE_PESQUISA}         //input[contains(@type,'submit')]
${BOTÃO_DE_PESQUISA}         nav-search-submit-button
${CLIQUE_PRODUTO}            //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
${ADICIONAR_CARRINHO}        add-to-cart-button
${PRODUTO_ADICIONADO}        sw-all-product-variations
${BOTAO_EXCLUIR}             //input[@value='Excluir']

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}  options=add_experimental_option("detach", True)
    Maximize Browser Window
    

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Sleep    10s
    Wait Until Element Is Visible    locator=${MENU_LIVROS}

Entrar no menu "Livros"
    Click Element    locator=${MENU_LIVROS}

Verificar se aparece a frase "${TEXTO_HEADER_LIVROS}"
    Wait Until Page Contains    text=${TEXTO_HEADER_LIVROS}
    Wait Until Element Is Visible    locator=${HEADER_LIVROS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=${ELEMENT}
    
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=${BARRA_DE_PESQUISA}     text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=${BOTÃO_DE_PESQUISA}

Verificar o resultado da pesquisa se está listando o produto pesquisado
    Title Should Be    title=Amazon.com.br : Xbox Series S

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=${CLIQUE_PRODUTO}
    Click Element    locator=${ADICIONAR_CARRINHO}

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Element Should Be Visible    locator=${PRODUTO_ADICIONADO}

# Gerkin steps

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Livros"
    Entrar no menu "Livros"

Então o título da página deve ficar "Livros | Amazon.com.br"
    Verificar se o título da página fica "Livros | Amazon.com.br"

E o texto "Loja de Livros" deve ser exibido na página
    Verificar se aparece a frase "Loja de Livros"

 E a categoria "livros em oferta" deve ser exibida na página
     Verificar se aparece a categoria "livros em oferta"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar o resultado da pesquisa se está listando o produto pesquisado

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto pesquisado

E adiciono o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto pesquisado
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando removo o produto "Console Xbox Series S" do carrinho
    Click Element    locator=//a[contains(@data-csa-c-type,'button')]
    Wait Until Page Contains    text=Carrinho de compras
    Click Element    locator=${BOTAO_EXCLUIR}

Então o carrinho deverá ficar vazio
    Wait Until Page Contains    text=Seu carrinho de compras da Amazon está vazio.
    
