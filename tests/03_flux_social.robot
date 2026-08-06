*** Settings ***
Resource    ../resources/keywords_communs.resource
Library     String
Library     SeleniumLibrary

*** Variables ***
${EMAIL}            safaezellou2022@gmail.com
${PASSWORD}         sofia140A
${BASE_TITLE}       Automation Article 
${DESCRIPTION}      Ceci est une description automatisée via Robot Framework.
${BODY_CONTENT}     Le contenu de cet article est généré par un script de test QA robuste.
${TAG_NAME}         qa_maroc

*** Test Cases ***
Validation Du Flux Social Complet
    [Documentation]    Test du périmètre Flux Social : Connexion, Création d'article, Ajout de tags et Commentaires.
    Ouvrir L Application Et Maximiser
    Se Connecter À L Application              ${EMAIL}    ${PASSWORD}
    Générer Un Titre D Article Unique
    Naviguer Vers Le Formulaire De Création
    Remplir Et Soumettre L Article            ${TITRE_ARTICLE}    ${DESCRIPTION}    ${BODY_CONTENT}    ${TAG_NAME}
    Vérifier La Publication De L Article      ${TITRE_ARTICLE}    ${TAG_NAME}
    Ajouter Un Commentaire À L Article        Super article de test !
    Vérifier L Ajout Du Commentaire           Super article de test !
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

Générer Un Titre D Article Unique
    ${chaine_aleatoire}=    Generate Random String    5    [NUMBERS]
    Set Suite Variable      ${TITRE_ARTICLE}    ${BASE_TITLE} ${chaine_aleatoire}

Naviguer Vers Le Formulaire De Création
    Wait Until Element Is Visible    css:a[href="/editor"]    timeout=10s
    Click Element                    css:a[href="/editor"]

Remplir Et Soumettre L Article
    [Arguments]    ${title}    ${desc}    ${body}    ${tag}
    Wait Until Element Is Visible    css:input[placeholder="Article Title"]    timeout=5s
    Input Text                       css:input[placeholder="Article Title"]    ${title}
    Input Text                       css:input[placeholder="What's this article about?"]    ${desc}
    Input Text                       css:textarea[placeholder="Write your article (in markdown)"]    ${body}
    Input Text                       css:input[placeholder="Enter tags"]    ${tag}
    # Presser Entrée pour valider le tag si l'application le requiert
    Press Keys                       css:input[placeholder="Enter tags"]    ENTER
    Click Button                     css:button.btn-primary

Vérifier La Publication De L Article
    [Arguments]    ${expected_title}    ${expected_tag}
    # Attendre que le titre de l'article publié s'affiche en grand h1
    Wait Until Element Is Visible    css:h1    timeout=10s
    Element Should Contain           css:h1    ${expected_title}
    # Vérifier que le badge du tag est bien présent sur l'article
    Element Should Contain           css:.tag-list    ${expected_tag}



Ajouter Un Commentaire À L Article
    [Arguments]    ${comment_text}
    Wait Until Element Is Visible    css:textarea[placeholder="Write a comment..."]    timeout=5s
    Input Text                       css:textarea[placeholder="Write a comment..."]    ${comment_text}
    # Ciblage plus robuste du bouton de soumission par sa classe ou son texte
    Wait Until Element Is Visible    xpath://button[contains(text(), 'Post')]          timeout=5s
    Click Button                     xpath://button[contains(text(), 'Post')]

Vérifier L Ajout Du Commentaire
    [Arguments]    ${expected_comment}
    # Attente universelle de la présence du texte du commentaire sur la page
    Wait Until Page Contains         ${expected_comment}   