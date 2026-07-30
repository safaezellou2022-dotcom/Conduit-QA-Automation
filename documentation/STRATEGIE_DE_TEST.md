# Stratégie de Recette QA - Réseau Social "Conduit"

**Application Cible :** [Conduit RealWorld App](https://realworld.io)  
**Ingénieure QA :** [ZELLOU Safae]  
**Framework de Test :** Robot Framework (Python) + SeleniumLibrary  

---

## 1. Contexte du Projet
Ce projet simule une prestation de conseil QA pour valider les fonctionnalités majeures d'un réseau social dynamique (Conduit). 
L'objectif est d'assurer la conformité fonctionnelle et de mettre en place une suite de tests de non-régression automatisée sur le tunnel utilisateur.

## 2. Périmètre des Tests (Scope)
* **Gestion des Comptes :** Inscription d'un nouvel utilisateur, connexion et déconnexion.
* **Flux Social (Social Feed) :** Création d'une publication, ajout de tags, rédaction de commentaires.
* **Interactions :** Bouton "Favori" (Like) sur l'article d'un autre utilisateur.

## 3. Stratégie d'Automatisation
* **Design Pattern :** Approche "Keyword-Driven" pour concevoir des scripts lisibles et réutilisables.
* **Gestion des données :** Utilisation de variables dynamiques (ex: génération d'emails aléatoires pour l'inscription).
