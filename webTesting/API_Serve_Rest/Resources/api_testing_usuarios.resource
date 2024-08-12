*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}    Generate Random String  length=6  chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Log    Minha palavra aleatória: ${palavra_aleatoria}@emailtest.com
    Log To Console    Minha palavra aleatória: ${palavra_aleatoria}@emailtest.com
    Set Test Variable    ${Email_Teste}    ${palavra_aleatoria}@EmailTeste.com

Cadastrar o usuário criado na ServeRest
    [Arguments]    ${email}    ${Status_code_desejado}
    ${body}    Create Dictionary    
    ...        nome=Fulano da silva    
    ...        email=${Email}    
    ...        password=1234    
    ...        administrador=true
    Log    ${body}
    Criar Sessão na ServeRest
    ${resposta}    POST On Session
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            json=${body}
    ...            expected_status=${Status_code_desejado}

    Log    ${resposta.json()}
    IF  ${resposta.status_code}== 201
    Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
    END
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    
Criar Sessão na ServeRest
    ${headers}    Create Dictionary
    ...    accept=application/json
    ...    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}


Conferir se o usuário foi cadastrado corretamente
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    dictionary=${RESPOSTA}   key=message    value=Cadastro realizado com sucesso
    Dictionary Should Contain Key    dictionary=${RESPOSTA}    key=_id

Vou repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest    email=${Email_Teste}    Status_code_desejado=400

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    key=message    value=Este email já está sendo usado

Consultar os dados do novo usuário
    ${Resposta_consulta}    GET On Session    alias=ServeRest    url=/usuarios/${ID_USUARIO}
    Set Test Variable    ${RESP_CONSULTA}    ${Resposta_consulta.json()}
    Log    $resposta_confulta.status_code.status_code{}
    Log    $resposta_confulta.status_code.reason{}
    Log    $resposta_confulta.status_code.headers{}
    Log    $resposta_confulta.status_code.elapsed{}
    Log    $resposta_confulta.status_code.text{}
    Log    $resposta_confulta.status_code.json{}

Conferir os dados retornados
    Log    ${RESP_CONSULTA}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    key=nome    value=Fulano da silva
    Dictionary Should Contain Item    ${RESP_CONSULTA}    key=email    value=${Email_Teste}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    key=password    value=1234
    Dictionary Should Contain Item    ${RESP_CONSULTA}    key=administrador    value=true
    Dictionary Should Contain Item    ${RESP_CONSULTA}    key=_id    value=${ID_USUARIO}