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

* les mots entre parentheses sont des mots-clefs qui sont parfois simplement survolés
* PIAT: "put it all together" est un cas pratique qui illustre la combinaison de plusieurs concepts

* 2 mots sur
    * la philosophie, la terminologie et l'histoire
        (unix,*bsd,system V,posix,standards,GNU)
    * les parts de marché
    * les environements graphiques
* ma premiere session unix
    * ssh, un terminal et un shell 
    * tmux
* doc en ligne
    * -h et --help 
    * apropos
    * man et pagers
    * info
* gestion des fichiers
    * organisation (cd,pwd,mv,ls,ln,cp,rsync,fdisk,mount,fuse,9p)
    * edition (vi)
* plus de ssh
    * fonctionnement général
    * gestion des clefs
    * .ssh/config .ssh/authorized_keys
    * scp, rsync
    * forward (port, auth)
    * proxycommand
    * PIAT: synchroniser des répertoires avec une machine qui n'est pas directement accessible depuis son réseau 
* comment communiquer avec unix
    * shells graphiques
    * CLI
    * remote (ssh, scp, ... )
    * PIAT: session partagée avec tmux et ssh restricted command 
* plus de shell 
    * variables
    * symboles 
    * redirections
    * pipes
    * gestion des processus et fichiers
    * les bases de globbing
    * les pipes et filtres
* les fichiers
     * chemins, organisation générale du systeme
     * montage
     * liens 


