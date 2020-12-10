# ESGI - Cours électif - Devops

## Projet

Ce projet est une évalutation des compétences acquises en cours. Il consiste à mettre en place le **CI** et le **CD** d'une application déjà opérationnelle.
Voici un lien permettant de tester l'application actuellement en live : 
- [Application Hello-World](http://f63963e3-bf80-48e6-b72c-da173649041e.pub.instances.scw.cloud:81/#/ "hello-container")


### Technologie utilisée
- Github actions
- Terraform (**v0.13**)
- Docker/ Docker hub
- Hébergement recevant le déploiement sur **Scaleway**
- Application **hello-world** fournie dans la consigne

### Groupe :
- **BOURKHIS** Hedi
- **HEDDADJ** Steven
- **IHYATEN** Imane
- **JACQUENET** Jean Christophe

## Déploiment de l'application

### Commit et Push sur la branche

![Commit et Push sur la branche](https://i.postimg.cc/pr90s6jS/1.gif "Commit et Push sur la branche")

### Attendre que le CI/CD se termine

![Attendre que le CI/CD se termine](https://i.postimg.cc/hvH261bt/1a.gif "Attendre que le CI/CD se termine")

![Build & push sur un Docker Repository](https://i.postimg.cc/SQ51nmFb/2.gif "Build & push sur un Docker Repository")

![5a.gif](https://i.postimg.cc/zfpv7JTx/5a.gif)

![Deploiement](https://i.postimg.cc/J4k6JSMD/6.gif "Deploiement")

### Testez l'application déployée
![Testez l'application déployée](https://i.postimg.cc/bJrLvBmv/7.gif "Testez l'application déployée")

## Déroulement du CI/CD

### Build & push sur un Docker Repository
- Durant cette étape, un build docker de l'application et des tests sont effectués.
- Lorsque ceux-ci sont terminés, une connexion à un repository docker hub est lancée. Les images représentant le front et le back de l'application sont alors envoyés sur ce repository. Par souci de classement, les images sont taggées avec le SHA du commit en cours.
![Build & push sur un Docker Repository_2](https://i.postimg.cc/Z5Pws39J/a.png "Build & push sur un Docker Repository_2")

### Terraforming
- Pour cette étape, Terraform va analyser l'infrastructure déjà en place et décider de la garder ou de la mettre à jour.
- Une fois sa décision prise, des exports de l'id et l'IP des infrastructures est effectuée. Ces exports seront utilisés dans la partie déploiement.

```Evolution possible :

A l'heure actuelle, Terraforme créer en permanence de nouvelle instance scaleway. Il faudra qu'il puisse mettre à jour l'infrastructure en cours.

``` 
![Terraforming_2](https://i.postimg.cc/GpcqW2YG/b.png "Terraforming_2")

### Deploiement

- Dans la dernière étape, l'application est déployée sur Scaleway. 
- Grâce aux IP et ID exportées précédemment, des connexions en SSH sur les instances Scaleway de base de données et d'application sont lancées.
- Sur chacun des servers, docker est utilisé pour récupérer les images adéquates : 
    - la distribution officielle de redis pour le server de base de données
    - les images tagées du SHA du commit en cours pour les images de back et de front pour le server d'application.
![Deploiement_2](https://i.postimg.cc/JzCTQKzT/c.png "Deploiement_2")

## Conclusion 

Le déploiement de l'application est terminée. Elle n'aura demandé qu'une intervention humaine, l'envoie du code sur Github. 
