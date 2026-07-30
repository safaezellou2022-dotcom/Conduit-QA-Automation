*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Navigation directe vers l'interface de connexion
${URL}         https://realworld.app.is/
${BROWSER}      chrome
${EMAIL}        test_qa_maroc@gmail.com
${PASSWORD}     MonMotDePasse123

*** Test Cases ***
Vérifier L Affichage Des Erreurs De Connexion
    [Documentation]    Test de connexion direct et robuste.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # 1. Cliquer sur le lien "Sign in" de la page d'accueil
    Wait Until Element Is Visible    css:a[href="/login"]    timeout=10s
    Click Element    xpath://a[text()='Sign in']
    # 2. Saisir les données d'identification
    Input Text        xpath://input[@type='email']       ${EMAIL}
    Input Password    xpath://input[@type='password']    ${PASSWORD}
    
    # 3. Soumettre le formulaire
    Click Button    css:button.btn-primary

    # 4. L'assertion : Vérifier que le message d'erreur rouge est bien affiché
    Wait Until Page Contains    Invalid email or password    timeout=10s
    
    [Teardown]    Close Browser


