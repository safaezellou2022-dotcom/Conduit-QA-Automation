# Cahier de Tests Fonctionnels - Module Social Feed

## Case ID : TC_FEED_001 - Publication et Vérification d'un Article
* **Priorité :** Haute
* **Prérequis :** L'utilisateur est connecté et se trouve sur le tableau de bord.
* **Étapes :**
  1. Cliquer sur le bouton **"New Post"** dans la barre de navigation supérieure.
  2. Saisir un titre unique : `Mon Premier Test Réel QA - [Date/Heure]`
  3. Saisir une description courte : `Ceci est un test fonctionnel.`
  4. Saisir le corps de l'article : `Validation de l'affichage sur le flux public.`
  5. Ajouter un tag : `QA`
  6. Cliquer sur **"Publish Article"**.
* **Résultat Attendu :**
  * L'article est publié avec succès et l'utilisateur est redirigé vers la page de l'article.
  * En cliquant sur "Home" puis sur l'onglet **"Global Feed"**, l'article doit apparaître en haut de la liste avec le bon titre, le bon auteur et le tag "QA".
