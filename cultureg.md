* la philosophie, la terminologie et l'histoire
    (unix,*bsd,system V,posix,standards,GNU)
* les parts de marché
* les environements graphiques

# Unix

- une version originale (20 avril 1969)
- une famille de systèmes d'exploitations (OS pour operating system) dérivés
- qui gardent des similitudes (standards, culture)
- qui représentent 90% du marché des OS (ordinateurs)

(macos, android, les équipements réseau, multimédia, les )

# Organisation du système de fichiers

le système de fichiers unix contient une arborescence de répertoires telle que

* tout répertoire contient
  * éventuellement des fichiers
  * éventuellement d'autres répertoires
    * lorsque A contient un répertoire B on dit
      * de A qu'il est parent de B
      * de B qu'il est enfant de A
* il existe un répertoire racine (ou root), noté /, qui n'a pas de parent
* contrairement à windows, il n'existe pas de "lecteurs" et encore moins de
  lecteurs réservés. Le système d'exploitation est installé dans la racine.
* grace à l'appel système `mount` (ou à la commande) 
un nouveau périphérique (ou tout autre objet physique ou logique fournissant un répertoire) est associé à un répertoire


    * le répertoire contenant des enfants est appellé le parent
  * toujours un sous-répertoire . faisant référence à lui-même
  * toujours un sous-répertoire faisant référence à son parent


    * pouvant contenir des sous-répertoires
    * contennant (sauf la racine) contenant toujours

/

* La racine contient 

* Tout répertoire (hormis la racine)
tout 



# Sous vos yeux, le shell

Ici, l'instructeur vous aura guidé pour ouvrir ce shell. si vous êtes seuls, il
vous faut lancer un de ces programmes:

Sous                            lancez
----                            ------
windows (cygwin)                la console cygwin
windows (machine distante)      putty
macos X                         l'application "terminal"
linux (environement graphique)  cherchez un "émulateur de terminal"
linux (console)                 saisissez votre login name et mot de passe

Quelque soit la solution choisie, vous avez maintenant sous les yeux une chaine
de caractères, informatifs ou non, suivie d'un curseur vous invitant à saisir
du texte.

Que vous vous soyez connecté à  votre machine par un émulateur de terminal
(nous expliquerons le terme plus tard) ou grace à un client ssh, vous avez sous
les yeux un shell. vous allez passer vos ordres au système en tappant des
commandes
