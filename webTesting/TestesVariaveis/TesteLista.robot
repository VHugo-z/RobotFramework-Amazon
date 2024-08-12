*** Settings ***
Documentation    Esse teste rodará a lista com todos os meses do ano.


*** Variables ***

@{MESES}    Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro


*** Test Cases ***

Mostrar os meses do ano
    Mostrar meses


*** Keywords ***

Mostrar meses
    Log    ${MESES[0]} ${MESES[1]} ${MESES[2]} ${MESES[3]} ${MESES[4]} ${MESES[5]} ${MESES[6]} ${MESES[7]} ${MESES[8]} ${MESES[9]} ${MESES[10]} ${MESES[11]}