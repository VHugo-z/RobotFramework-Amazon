*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador



*** Test Cases ***

Caso de Teste 03 - Adicionar produto no Carrinho
    [Documentation]    Esse teste irá adicionar um produto no carrinho.
    [Tags]             menu    categorias    carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto pesquisado
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso


Caso de Teste 04 - Remover produto do carrinho
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Dado que estou na home page da Amazon.com.br
    E adiciono o produto "Console Xbox Series S" no carrinho
    Quando removo o produto "Console Xbox Series S" do carrinho
    Então o carrinho deverá ficar vazio
    


    