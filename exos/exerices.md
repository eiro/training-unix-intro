# Méthode générale

quand le problème parait compliqué:

* tenter de mettre le KISS en application
* subdivisez votre problème dans des fonctions
* n'hésitez pas a définir des formats intermédiaires simples et réutilisables
  si besoin.
  * séparez bien les 3 étapes
    * acquisition
    * mise en forme
    * reporting

bonne chance! 

# bosser sur ramfs.go

faire un cd dans le sous-répertoire de src contenant le fichier ramfs.go

## solution dash

    where=`find src -name ramfs.go -printf "%p"`
    cd ${where%/*}

ou

    cd $( dirname $( find src -name ramfs.go -printf "%p" ))

## solution zsh

    cd src/**/ramfs.go(:h)

# reporter df sur une marchine rapport

stocker le résultat de df sur une marchine distante 

# corrigé

    df | ssh rapport "cat > /tmp/df.$( hostname )"

# untar à la volée 

en utilisant curl, tar et gzip, créez une copie des
[sources de sympa](http://www.sympa.org/distribution/sympa-6.1.17.tar.gz)
sans avoir copié le tarball sur le disque dur.

## corrigé

    curl http://www.sympa.org/distribution/sympa-6.1.17.tar.gz |
        gzip -d |
        tar xf -

# yes!

écrivez une fonction 'y' qui se comporte comme la commande yes.

# Marylin

écrivez la commande 'marylin' telle que

    yes "happy birthday to you," | marylin

se termine apres avoir affiché

    happy birthday to you,
    happy birthday to you,
    happy birthday to you,
    happy birthday to you, mister president
    happy birthday to you!

# ufw.log

prenez connaissance du fichier ufw.log. il contient la liste des BLOCKs
effectués par mon firewall.

créer un fichier top10.txt contenant les 10 adresses IPv4 les plus bloquées.

## méthode

* dans les lignes qui contiennent "UFW BLOCK", extraire l'adresse IPv4
* utilisez un paramètre d'uniq qui vous permette de comptabiliser les occurrences
  (notez qu'uniq nécessite que l'entré soit préalablement triée)
* avec sort, triez *numériquement* et dans l'ordre décroissant le résultat de uniq
* avec sed, conserver le top 10 

## squelette

    reported_as_blocked_in ufw.log |
              sorted_by_occurrence |
              top10 > top10.txt

## corrigé

reported_as_blocked_in () { sed -r '/UFW BLOCK/s/.* SRC=(\S+).*/\1/' $1 }
sorted_by_occurrence () { sort | uniq -c | sort -rn } 
top10 () { sed 10q }

# Afficher les jours de la semaine

grace au format de la commande date, affichez le nom du jour pour 
* lundi + 0 jours
* lundi + 1 jours
* ...
* lundi + 6 jours

## corrigé

for d ({0-6}) date -d "monday + $d day" +%A

cmd='date -d "monday + & day" +%A'
seq 0 6 |
    sed "s/.*/$cmd/" |
    sh

# uri2mail

afin de pouvoir envoyer des courriels trouvés sous forme d'URL avec votre
client messagerie,  il vous faut transformer

    mailto:mutt-po-request@mutt.org?Body=toto%20haha%0Atata&Cc=toto&Subject=Subscribe%20Mutt%20Translators

en 

    To: mutt-po-request@mutt.org
    Cc: toto
    Subject: Subscribe Mutt Translators

    toto haha
    tata

y'a plus qu'à ... 

## Méthode

* afficher la structure du message avec les différentes parties ligne par ligne

    To=mutt-po-request@mutt.org
    Body=toto%20haha%0Atata
    Cc=toto
    Subject=Subscribe%20Mutt%20Translators

* placez le Body sur la dernière ligne, remplacez les % par des \x

    To=mutt-po-request@mutt.org
    Cc=toto
    Subject=Subscribe\x20Mutt\x20Translators
    Body=toto\x20haha\x0Atata

* transformez les = en :, pour la derniere ligne, remplacez Body= par une ligne vide

    To:mutt-po-request@mutt.org
    Cc:toto
    Subject:Subscribe\x20Mutt\x20Translators

    toto\x20haha\x0Atata

* passez le tout a printf pour remplacer les \xdd par les symboles equivalents

## corrigé

    m='mailto:mutt-po-request@mutt.org?Body=toto%20haha%0Atata&Cc=toto&Subject=Subscribe%20Mutt%20Translators'

    each_parts_as_line () {
        sed '
            s/mailto:/To=/
            s/[?&]/\n/g
        '
    }

    ended_by_body () {
        sed -n '
            s/%/\\x/g
            /^Body=/{x;d}
            $G
            p'
    }

    reformat () {
        sed '
            $ { s/Body=/\n/; q }
            s/=/: /
        '
    }

    /usr/bin/printf "$(
        print $m | 
            each_parts_as_line |
            ended_by_body |
            reformat
    )"



# afficher l'état des coeurs

c'est juste un exemple d'utilisation de /sys,

    grep -n . /sys/devices/system/cpu/cpu[0-9]/online

vous permet de connaitre le nombre de coeurs actifs sur la machine 

# mon nginx, stp

cher administrateur, de temps en temps, je compile un nginx pour test dans
/opt/nginx/nginx. pourrais-tu modifier le script d'init.d pour que, lorsque je
tappe 

    service nginx start

le nginx lancé soit

* la version homebrew si elle existe
* la version du systeme par defaut

d'avance merci. 

## corrigé

    vimdiff nginx{,.new}

