*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}           https://realworld.app.is/
${BROWSER}      chrome
${BASE_USER}    QA_Conduit_
${PASSWORD}     Securite123!

*** Test Cases ***
Validation De Inscription D Un Nouvel Utilisateur
    [Documentation]    Test nominal d'inscription avec données dynamiques (Keyword-Driven).
    Ouvrir L Application Conduit
    Naviguer Vers La Page D Inscription
    Générer Des Données Utilisateur Aléatoires
    Saisir Les Informations D Inscription    ${NOM_UTILISATEUR}    ${EMAIL_GENERE}    ${PASSWORD}
    Soumettre Le Formulaire D Inscription
    Vérifier Que Le Compte Est Créé Et Connecté
    [Teardown]    Close Browser

*** Keywords ***
Ouvrir L Application Conduit
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Naviguer Vers La Page D Inscription
    Wait Until Element Is Visible    css:a[href="/register"]    timeout=10s
    Click Element                    css:a[href="/register"]

Générer Des Données Utilisateur Aléatoires
    ${suite_aleatoire}=     Generate Random String    6    [NUMBERS][LOWER]
    Set Suite Variable      ${NOM_UTILISATEUR}        ${BASE_USER}${suite_aleatoire}
    Set Suite Variable      ${EMAIL_GENERE}           qa_${suite_aleatoire}@gmail.com

Saisir Les Informations D Inscription
    [Arguments]    ${username}    ${email}    ${password}
    Wait Until Element Is Visible    css:input[placeholder="Username"]    timeout=5s
    Input Text                       css:input[placeholder="Username"]    ${username}
    Input Text                       css:input[placeholder="Email"]       ${email}
    Input Password                   css:input[placeholder="Password"]    ${password}

Soumettre Le Formulaire D Inscription
    Click Button    css:button.btn-primary

Vérifier Que Le Compte Est Créé Et Connecté
    # Une fois inscrit, Conduit connecte l'utilisateur automatiquement.
    # On vérifie la présence du bouton de configuration et du nom d'utilisateur dans le menu.
    Wait Until Element Is Visible    css:a[href="/settings"]    timeout=10s
    Page Should Contain              ${NOM_UTILISATEUR}
