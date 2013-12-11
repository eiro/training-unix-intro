% Introduction à Unix
% Marc Chantreux

# Audience et objectifs

Cette formation a pour but de vous faire découvrir un panel d'outils et de
concepts communs à la plupart des unices qui rendent son utilisation
confortable et productive.

Tous les outils seront présentés avec deux objectifs:

* se mettre à l'aise avec les fonctions de base en pratiquant des cas d'utilisation réels mais simples
* percevoir le potentiel d'un usage avancé

Tant que faire ce peut, les concepts se veront enrichis par des exercices et
corrigés d'approfondissement à réaliser après la formation.

les parties pratiques seront effectués sous debian linux  

dans le programme indicatif qui suit:

# Plan

## principes fondateurs et terminologie

Evoquer rapidement l'histoire d'unix et son impact pratique sur son usage
actuel. Présenter la notion de standards et de culture qui relient les unices
entre eux.

mots-clefs: implémentations, standards, POSIX, culture, KISS (Keep It Stupid
Simple), open source, GNU, toolset, toolchain.

## Première connexion

Découvrir les commandes permettant de collecter des informations sur
notre environement et les concepts de base de l'organisation du système:

* les bases de données système
  (getent, pam, nss)
* les utilisateurs et groupes
* organisation du système de fichiers
  * droits
  * arborescence (racine, parentée, récursivité)
  * montages et filesystems
  * filesystems spéciaux (devfs, sysfs, ramfs, unionfs, …)
  * liens et liens symboliques
* aide en ligne (--help, man, info, apropos, pagers)

au passage, nous évoquons aussi la syntaxe d'une commande de base et les
rudiments de l'interactivité.

mots-clefs: shell,login shell, /etc/shells, bareword, history, profile

## les bases de l'edition de texte avec vi

* pourquoi vi? (présent partout, rarement cassé, finalement simple)
* les modes
* déplacements, modifications de base
* registres, marks, et macros
* interagir avec le shell
* enregistrer, enregistrer sous, quitter

## manipulation de fichiers

* suppression, renommage, copie, copie récursive, compression, concatenation
* recherche par nom, par metadonnées (find, stat)  
* recherche par contenu, edition par stream, regexp

## ssh

ssh apparait avant les manipulations de fichiers: les fichiers distants ne sont
pas spécifiques dans la gestion de fichiers. 

* fonctionnement général
* gestion des clefs
* .ssh/config .ssh/authorized_keys
* scp, rsync
* forward (port, auth)
* proxycommand
* shell interactif, tmux

exercice final: session partagée avec tmux et ssh restricted command

## shell scripting

* tout est fichier (terminal, caractères de controle,)
* le shell est un filtre, apres tout
* les pipes
* filtres (awk, sed, com,...)
* symboles 
* variables
* redirections
* pipes
* subshells, background et jobs
* les bases de globbing

## plus loin …

ces points ne seront abordés que sous la forme d'exemples et de TP pour les
personnes qui ont éppuisé les exos prévus par le cours

* vim comme shell ?
* simplifier la production avec make
* typesetting (production de PDFs) avec les outils unix standard
* controle de révision avec git 

# FAQ

## Pourquoi pas bash?

Les corrigés des exercices ne sont pas proposés dans l'ordre

* zsh: ce shell moderne est un bon équilibre entre les bonnes idées des
  différents shells historiques et des ajouts qui, si ils cassent la
  rétrocompatibilité avec ces derniers, permettent d'améliorer
  considérablement la lisiblité, la fiabilité et la concision des scripts.
* mksh: Implementation du standard 88 de Korn Shell
* dash: Implementation du standard POSIX du Bourne Shell

Bash n'est pas un mauvais shell mais sa position dominante dans le monde du
desktop linux ne doit pas faire oublier la diversité d'unix. dash et mksh sont
par exemple des choix bien plus pertinents sur les systèmes legers/embarqués et
zsh se fait fort d'une communauté de plus en plus large.

Pour ma part (et apres avoir été un des instiguateurs de [la traduction
française de l'Advanced Bash Scripting](http://abs.traduc.org/) au début des
années 2000), je concidère aujourd'hui que bash est devenu un cas spécifique
qui n'a pas sa place dans une introduction à unix.

