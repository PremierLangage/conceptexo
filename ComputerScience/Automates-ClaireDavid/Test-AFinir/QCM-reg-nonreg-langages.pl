
extends=/model/AMC_TXT.pl 

title= QCM régulier - non régulier

message = Le langage suivant est-il est régulier ou non-régulier?

# une étoile radio deux check box
questions==
* {{ message }} {a^nb^m|\exists p\ n+m = 2p}
+ régulier
- non régulier
- aucune idée

* {{ message }} L2
+ régulier
- non régulier
- aucune idée

* {{ message }} L3
+ régulier
- non régulier
- aucune idée

==







