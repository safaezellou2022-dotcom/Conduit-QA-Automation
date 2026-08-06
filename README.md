# 🚀 Suite de Tests de Non-Régression Automatisée - Conduit (RealWorld)

## 📌 Contexte du Projet
Ce projet simule une prestation de conseil en Assurance Qualité (QA) visant à valider les fonctionnalités majeures d'un réseau social dynamique (**Conduit**).
L'objectif est de garantir la conformité fonctionnelle de l'application et de mettre en place une suite de tests de non-régression robuste et automatisée
sur l'ensemble du tunnel utilisateur.

---

## 🎯 Périmètre des Tests (Scope)

La suite de tests couvre 100% des exigences fonctionnelles définies dans le cahier des charges :

*   **Gestion des Comptes** : 
    *   Inscription dynamique d'un nouvel utilisateur.
    *   Connexion nominale sécurisée.
    *   Déconnexion de l'application avec retour à l'état invité.
*   **Flux Social (Social Feed)** : 
    *   Création et publication d'un nouvel article.
    *   Ajout et gestion automatique de tags (gestion de la casse).
    *   Rédaction et validation de l'affichage des commentaires.
*   **Interactions** : 
    *   Ajout d'une publication en "Favori" (Like) sur le fil d'actualité global (*Global Feed*).

---

## 🛠️ Stratégie d'Automatisation & Design Pattern

*   **Framework** : [Robot Framework](https://robotframework.org) couplé avec **SeleniumLibrary** pour la manipulation du navigateur.
*   **Design Pattern** : Approche **Keyword-Driven** permettant de concevoir des scripts hautement lisibles, réutilisables et faciles à maintenir.
*   **Gestion des Données** : Utilisation de variables dynamiques et de la librairie *String* (génération d'identifiants et d'emails aléatoires uniques à chaque exécution pour éviter l'engorgement de la base de données).
*   **Architecture du Projet** :
    ```text
    ├── resources/
    │   └── keywords_communs.resource   # Mots-clés globaux (Ouverture/Fermeture/Déconnexion)
    ├── tests/
    │   ├── 01_inscription.robot        # Inscription dynamique & Déconnexion
    │   ├── 02_connexion.robot          # Connexion utilisateur
    │   ├── 03_flux_social.robot        # Publication, tags et commentaires
    │   └── 04_interactions.robot       # Système de favoris (Likes)
    ├── .gitignore                      # Exclusion des rapports locaux et logs
    └── README.md                       # Documentation du projet
    ```

---

## 💻 Installation et Prérequis

### 1. Prérequis système
*   **Python 3.x** installé sur votre machine.
*   Le navigateur **Google Chrome** mis à jour.

### 2. Installation des dépendances
Ouvrez votre terminal à la racine du projet et installez les librairies requises :
```bash
pip install robotframework robotframework-seleniumlibrary
```

---

## 🧪 Exécution des Tests

### Exécuter un script spécifique
Pour lancer un module de test individuel, utilisez l'une des commandes suivantes :

```bash
# Tester l'inscription dynamique
robot tests/01_inscription.robot

# Tester la connexion nominale
robot tests/02_connexion.robot

# Tester le flux de publication
robot tests/03_flux_social.robot

# Tester les interactions de favoris
robot tests/04_interactions.robot
```

### Exécuter toute la suite de tests (Recommandé)
Pour exécuter l'ensemble de la suite de non-régression en une seule fois et générer un rapport consolidé :
```bash
robot tests/
```

---

## 📊 Rapports d'Exécution
À la fin de chaque exécution, Robot Framework génère automatiquement des rapports détaillés à la racine du projet :
*   `report.html` : Une vue d'ensemble graphique des résultats (Statuts PASS/FAIL).
*   `log.html` : Un journal d'audit étape par étape avec captures d'écran intégrées en cas d'échec.

*(Note : Ces rapports sont volontairement ignorés par Git via le fichier `.gitignore` afin de ne pas surcharger le dépôt).*
