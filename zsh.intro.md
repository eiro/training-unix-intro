% Introduction à zsh

# Notes de rédaction

la partie "néologisme" devrait fusionner avec "qu'est ce qu'un shell": la
comparaison avec le langage naturel fonctionne bien: les implementations sont
des dialectes. 

# Préambule

## pour les utilisateurs de shell historiques (ou de zsh)

l'objectif de ce document est de fournir une documentation conçise qui permette
au lecteure de prendre rapidement des habitudes productives, confortables et
les plus fiables possibles. Ce faisant, je fais des choix forts et n'aie
nullement l'intention d'être exhaustif. Ainsi: 

* j'utilise la syntaxe "alternative" (telle que décrite dans le chapitre 6.4 de
  la documentation), la syntaxe inspirée du Bourne shell est appellée "syntaxe
  historique" dans le préesent document.
* les options de compatibilité ne sont présentées que comme des solutions pour
  faire tourner des scripts existants.
* je pars du principe que tout .zshenv devrait commencer par 

    setopt warncreateglobal nounset extendedglob braceccl pathdirs errreturn

* et donc que la seule bonne façon de savoir si une variable existe (les autre
  planteront grace à nounset) est

    (( $+var ))

* je ne cite ni fizsh ni oh-my-zsh dans ce document:

* oh-my-zsh et fizsh sont à mes yeux de très bonnes façon de perdre l'essentiel
  de vue rapidement. ZEN n'a pas l'air de bouger (dernière modif. en 2011?).
  je ne cite donc ces projets que comme des exemples de code.

toutefois, tous ces choix sont dictés par le pragmatisme et non par une
quelconque religion. n'hésitez donc pas à me faire parvenir toute question,
remarque documentée ou argumentée.

## néologisme assumé

le shell vous permet d'écrire des phrases (appellées instructions) dont le
premier mot est presque toujours un verbe. ces phrases seront executées par
votre ordinateur lorsqu'elles seront

* complètes
* syntaxiquement valables (l'ordinateur ne fait aucune suposition quand au
  bienfondé de ce que vous lui demandez: des garde-fous exisent par ailleurs)
* validées (dans un environement interactif vous devez tapper sur la touche
 `<ENTREE>` pour signaler à l'ordinateur que vous avez fini de saisir votre ou
 vos phrases)

ces phrases sont validées (executées par votre ordinateur) lorsqu'elles sont 

Et de même que nous transposons des
mots d'une langue à l'autre, ce qui nous permet de "mettre un pyjama pendant le
week-end", les informatiens et les machines utilisent des verbes directement
empruntés aux fonctionnement des machines et aux verbes présents dans le shell.
Donc "quand la machine swappe, je dois killer des process", cette phrase est
tout à fait acceptable pour un unixien.

je me servirais à l'occasion de cette pratique forte utile dans le présent cours.
ainsi, "avoir chrooté /usr/experiment" ou "avoir chroot /usr/experiment"
signifie concrètement que j'ai tappé puis validé l'instruction

    chroot /usr/experiment

notez que contrairement au langages naturels, il n'y a jamais que la 3eme
personne qui soit utilisée et qu'il n'existe pas de distinction entre le
singulier et le pluriel. la conjugaison est donc inutile et seule la forme
infinitive existe.

ainsi, pendant le cours (et dans le présent document), je vais setopt des options,
chroot des répertoires, source (ou sourcer) des fichiers, en pratique 

    chroot /usr/experiment
    setopt pathdirs
    source ./functions.zsh

les explications sur ce que font ces commandes sont l'objet du présent cours.

## qu'est ce qu'un shell ?

un shell est une interface homme/machine qui vous permet d'interagir avec
l'ordinateur. les shells peuvent être graphiques (on parle communément d'interface graphique ou GUI )

* parler de CLI
* shell textuel: un langage
    pros
    * tout ajout d'expressivité dans une interface graphique se fait par l'ajout d'un composant
      (personne ne veut des menus déroulants de 200 entrées!), les langages n'ont pas cette limite
    * le texte peut être enregistré dans un fichier pour être rejoué: automatisation
      * réexecuter la tache (avec des paramètres)
      * 


    cons
    * apprentissage (grammaire et vocabulaire) (pas forcément un pro pour les GUI: complexes)
  * intructions
    * commande avec des parametres séparés par une suite d'espaces
    * les esapces sont donc des symboles "spéciaux" ou significatifs
    * ils perdent leur signification lorsqu'ils sont protégés
        * entre une paire de quotes, simples ou doubles

          echo             hello             world
          echo             hello\ \ \ \ \ \ \ \ \ \ \ \ \ world
          echo            'hello             world'
          echo            "hello             world"

        * attention donc a ne pas mettre de quote dans la quote

            > echo 'l'apostrophe'

            dans l'expression suivante, nous avons une premiere paire de quotes
            * ouvrante juste avant le l
            * fermante juste après le l

            une nouvelle quote s'ouvre donc à  la fin de la ligne, vous pouvez
            continuer à tapper du texte qui sera affiché jusqu'à la prochaine quote
            puis tapper "entrée".

            ce mécanisme fonctionnera tant que vous aurez ouvert une paire de
            quote sans la fermer. 

            quote> ne va malheureusement pas apparaitre', désolé 

                lapostrophe
                ne va malheureusement pas apparaitre, désolé.

            pour faire apparaitre la dite quote, il nous faut la protéger hors de la paire

echo 'l'\''apostrophe ne va malheureusement pas apparaitre, désolé.' 

qu'il faut lire en 3 étapes 

    'l'
    \'
    'apostrophe ne va malheureusement pas apparaitre, désolé.'

    dans rc et (et zsh si vous avez activé l'option rcquotes (en tappant
    `setopt rcquotes`),  vous pouvez aussi doubler une quote pour la protéger.

    echo 'l''apostrophe'

    perdent leur signification
        * entre des quotes simples ou double
        * lorsque protégés

        echo "hello world!"

    * 
# des instructions

##  ponctuation

* point-virgule
* retour à la ligne


le shell est un outils qui vous permet d'executer 

tant que faire ce peut, j'utilise la regle suivante dans présente documentation

* un executable est un fichier contenu dans le path


* une commande est 

# status code

a la fin de son execution, toute commande ou fonction renvoie la 

toute commande unix renvoie une status code à la fin de son execution, c'est
une valeur numérique comprise entre 0 et 255.

* dans les 
 
# source

les commandes '.' et source peuvent evaluer le contenu d'un fichier dans le
contexte du shell courant. ce fichier peut donc contenir des fonctions et des
variables qui seront directement accéssibles depuis ce shell.

vous pouvez stocker un ensemble de fonctions dans un fichier et ne les charger
qu'au besoin. on appelle ce fichier une "bibliothèque".  soit le ficher
functions.zsh contenant: 


    x=12
    greetings () { echo "hello $USER" }

une fois chargé, vous disposez des déclarations qu'il contient:

    > greetings
    zsh: command not found: greetings
    > source ./functions.zsh
    > greetings
    hello mc
    > greetings
    hello mc

lorsque que fichier est présent dans un répertoire du `$path`, il n'est plus
nécessaire de préciser un chemin absolu. 

path=( ~/bin )
mv functions.zsh ~/bin/functions
. functions

si vous avez `setopt pathdirs`, vous pouvez créer des sous-répertoires
## les namespaces

une meme fonction peut avoir une utilité différente selon le contexte. dump par
exemple ne dumpera pas la meme base de donnée en fonction du projet sur lequel
vous travaillez.

    dump () { sqlite ~/.projetx/db .dump }
    dump () { mysqldump prod soft }

en général, on prefixe le nom des fonctions pour é

il est possible d'utiliser  

/ dans le nom des fonctions 



. func



bibliothèques:


en utilisant pathdirs

python

    import un.tres.long.namespace as n
    print n.greetings(env["USER"])

perl 

    use aliased qw( Un::tres::long::namespace n );
    n::greetings $ENV{USER}

zsh

    s=un/tres/long/namespace
    . $s

    $s/greetings $USER


assurez-vous que ~/bin est dans votre $PATH

setopt pathdirs

fo








