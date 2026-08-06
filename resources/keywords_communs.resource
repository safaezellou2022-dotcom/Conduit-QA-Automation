*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://realworld.app.is/
${BROWSER}      chrome

*** Keywords ***
Ouvrir L Application Et Maximiser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fermer L Application
    Close Browser
Se Déconnecter De L Application
    [Documentation]    Navigue vers les paramètres et clique sur le lien de déconnexion.
    Wait Until Element Is Visible    css:a[href="/settings"]    timeout=10s
    Click Element                    css:a[href="/settings"]
    
    # Correction : Utilisation de 'Click Element' sur la balise de lien <a> repérée dans l'inspecteur
    Wait Until Element Is Visible    css:a[href="/logout"]      timeout=10s
    Click Element                    css:a[href="/logout"]
    
    # Validation du retour à l'état déconnecté (apparition du bouton Sign in)
    Wait Until Page Contains         A place to share your knowledge.                    timeout=10s
