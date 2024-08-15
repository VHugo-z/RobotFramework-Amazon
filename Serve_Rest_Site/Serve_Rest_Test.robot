*** Settings ***
Documentation    Essa suite irá testar várias funcionalidades do site front.serverest.dev/login
Resource         Serve_Rest_Site_resources.robot
Test Setup       Abrir o site
Test Teardown    Fechar o site



*** Test Cases ***

Caso de teste 01: Tentativa de login falha
    Dado que eu estou no site "https://front.serverest.dev/login"
    Quando digitar as informações
    E clicar em entrar
    Então deverá aparecer "Email e/ou senha inválidos"

Caso de teste 02: Registro com sucesso
    Dado que eu estou no site "https://front.serverest.dev/login"
    Quando clicar em Cadastrar-se
    E preencher as informações com administrador
    E clico em Cadastrar
    Então deverá aparecer "Cadastro realizado com sucesso"

Caso de teste 03: Senha obrigatória
    Dado que eu estou no site "https://front.serverest.dev/login"
    Quando digitar o email
    E clicar em entrar
    Então deverá aparecer "Password é obrigatório"

Caso de teste 04: Email obrigatório
    Dado que eu estou no site "https://front.serverest.dev/login"
    Quando digitar a senha
    E clicar em entrar
    Então deverá aparecer "Email é obrigatório"

Caso de teste 05: Nome de Cadastro obrigatório
    Dado que eu estou no site "https://front.serverest.dev/login"
    Quando clicar em Cadastrar-se
    E preencher o email e senha com administrador
    E clico em Cadastrar
    Então deverá aparecer "Nome é obrigatório"

Caso de teste 06: Email de Cadastro obrigatório
    Dado que eu estou no site "https://front.serverest.dev/login"
    Quando clicar em Cadastrar-se
    E preencher o nome e senha com admnistrador
    E clico em Cadastrar
    Então deverá aparecer "Email é obrigatório"

Caso de teste 07: Password é obrigatório
    Dado que eu estou no site "https://front.serverest.dev/login"
    Quando clicar em Cadastrar-se
    E preencher o nome e email com admnistrador
    E clico em Cadastrar
    Então deverá aparecer "Password é obrigatório"

Caso de teste 08: Cadastro de usuário
    Dado que eu estou no site "https://front.serverest.dev/login"
    E entro na conta
    E clico em cadastrar usuários
    Quando preencho as informações necessárias
    E clico em cadastrar usuários com admnistrador
    Então deverá aparecer a lista dos usuários

    