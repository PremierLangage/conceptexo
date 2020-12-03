extends= /AAAA/dominique/mathmatchlist.pl

title==
Matching list
==

before==

var('x')

f=[to meet, to know, to put, to see, to give, to say]
gf=[ f"$!{latex(fi)}!$" for fi in f]
df=[  f"$!{latex(diff(U,x))}!$" for U in f]

pairs= [ TT for TT in zip(gf,df)]

if type(pairs)==list:
    matchlist.setdata_from_matches(pairs)
else:
    matchlist.setdata_from_matches([ l.split("§") for l in  pairs.splitlines() if "§" in l ])

==

text==
Associez chaque fonction à sa dérivée.
==

doc ==
Exos à choix unique où on doit relier chaque élèment de la première case
à un élèment de la seconde case. 
Code couleurs : Après validation de la réponse 
-> Flèches vertes = réponses justes
-> Flèches rouges = réponses fausses
==