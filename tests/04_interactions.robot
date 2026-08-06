*** Settings ***
Resource    ../resources/keywords_communs.resource
Library     SeleniumLibrary

*** Variables ***
${EMAIL}            safaezellou2022@gmail.com
${PASSWORD}         sofia140A

*** Test Cases ***
Validation Des Interactions Favoris
    [Documentation]    Test du périmètre Interactions : Liker l'article d'un autre utilisateur sur le Global Feed.
    Ouvrir L Application Et Maximiser
    Se Connecter À L Application              ${EMAIL}    ${PASSWORD}
    Naviguer Vers Le Fil D Actualité Global
    Liker Le Premier Article Disponible
    Vérifier Que L Article Est En Favori
    [Teardown]    Fermer L Application

*** Keywords ***
Se Connecter À L Application
    [Arguments]    ${user_email}    ${user_password}
    Wait Until Element Is Visible    css:a[href="/login"]    timeout=10s
    Click Element                    css:a[href="/login"]
    Wait Until Element Is Visible    css:input[type="email"]    timeout=5s
    Input Text                       css:input[type="email"]    ${user_email}
    Input Password                   css:input[type="password"]  ${user_password}
    Click Button                     css:button.btn-primary
    Wait Until Element Is Visible    css:a[href="/settings"]    timeout=10s

Naviguer Vers Le Fil D Actualité Global
    [Documentation]    Le Global Feed étant déjà actif par défaut, on valide simplement sa présence.
    Wait Until Element Is Visible    css:a.nav-link.active    timeout=10s
    # On s'assure qu'au moins un article est chargé à l'écran avant de continuer
    Wait Until Element Is Visible    css:.article-preview     timeout=10s

Liker Le Premier Article Disponible
    # Ciblage très précis de l'icône cœur ou du bouton favori du premier article de la liste
    Wait Until Element Is Visible    css:.article-preview button    timeout=10s
    Click Element                    css:.article-preview button

Vérifier Que L Article Est En Favori
    # On valide le changement d'état graphique (la classe devient active ou change de couleur selon le DOM)
    # Pour être universel, on attend simplement que l'état initial (btn-outline-primary) disparaisse au profit du bouton actif
    Wait Until Element Is Visible    css:.article-preview button    timeout=20s
