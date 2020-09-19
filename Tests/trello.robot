*** Settings ***
Library  SeleniumLibrary
Documentation  Тестовое задание на позицию Junior QA Automation Engineer (Лебедь Дмитрий)

*** Variables ***
${EMAIL} =  up2dmas@gmail.com
${PASSWORD} =  xdcbgynj
${USERID} =  Дмитрий Лебедь (user04621215)
${DESKNAME} =  NewDesk
${CARDNAME} =  NewCard

*** Test Cases ***
1. Авторизоваться
    Open Browser  https://trello.com/  chrome
    Set Browser Implicit Wait  10
    Click Link  link:Войти
    Input Text  id:user  ${email}
    Input Text  id:password  ${password}
    Click Element  id:login
    Wait Until Element Contains  //div[@title='${userid}']//span  ДЛ  timeout=10

2. Создать новую доску с произвольным новым наименованием
    Click Element  //div[@class='board-tile mod-add'][contains(., "Создать доску")]
    Input Text  //input[@placeholder='Добавить заголовок доски']  ${deskname}
    Click Element  //button[@class='button primary']//span[contains(., "Создать доску")]

3. Перейти к доске
    Page Should Contain  ${deskname}

4. Создать новую карточку с произвольным наименованием и описанием
    Input Text  //textarea[@placeholder='Ввести заголовок для этой карточки']  ${cardname}
    Click Element  //input[@class='primary confirm mod-compact js-add-card']
    Click Element  //input[@value='Добавить карточку']

5. Перенести карточку в другую колонку
    Drag And Drop  //div[@class='list-card-details js-card-details']//span[contains(., "${cardname}")]  //body/div[@id='trello-root']/div[@id='chrome-container']/div/div[@id='surface']/main[@id='popover-boundary']/div[@id='content']/div/div/div/div[@id='board']/div[2]/div[1]/div[2]
    Capture Page Screenshot

6. Архивировать карточку
    Click Element  //div[@class='list-card-details js-card-details']//span[contains(., "${cardname}")]
    Page Should Contain  Архивация
    Click Element  //div[@class='u-clearfix']//a[@title='Архивация']
    Page Should Contain  Архивная карточка.
    Close Browser


*** Keywords ***
