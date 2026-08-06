*** Settings ***
Library    SeleniumLibrary
Resource  ../resources/keywords_communs.resource
*** Variables ***
${URL}          https://realworld.app.is/
${BROWSER}      chrome
${EMAIL}        safaezellou2022@gmail.com
${PASSWORD}     sofia140A

*** Test Cases ***
Vérifier La Connexion Utilisateur Réussie
    [Documentation]    Test de connexion nominal direct et robuste.
    Ouvrir L Application Et Maximiser
    Naviguer Vers La Page De Connexion
    Saisir Les Identifiants De Connexion    ${EMAIL}    ${PASSWORD}
    Soumettre Le Formulaire De Connexion
    Vérifier Que L Utilisateur Est Connecté

*** Keywords ***
Naviguer Vers La Page De Connexion
    # Utilisation du même localisateur CSS pour l'attente ET le clic
    Wait Until Element Is Visible    css:a[href="/login"]    timeout=10s
    Click Element                    css:a[href="/login"]

Saisir Les Identifiants De Connexion
    [Arguments]    ${user_email}    ${user_password}
    # Utilisation d'identifiants plus précis (comme la classe ou le placeholder si disponibles)
    Wait Until Element Is Visible    css:input[type="email"]    timeout=5s
    Input Text                       css:input[type="email"]    ${user_email}
    Input Password                   css:input[type="password"]  ${user_password}

Soumettre Le Formulaire De Connexion
    Click Button    css:button.btn-primary

Vérifier Que L Utilisateur Est Connecté
    # Assertion essentielle : on attend de voir un élément propre au profil connecté
    Wait Until Element Is Visible    css:a[href="/settings"]    timeout=10s

