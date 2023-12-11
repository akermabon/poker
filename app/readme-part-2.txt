Dans un troisième temps le candidat devra implémenter la méthode "winner" de la classe "Poker".
Cette méthode prend en paramètre deux hashs représentant les mains de poker de deux joueurs. Chaque hash est composé
de deux clés :
- "player" : le nom du joueur (String)
- "hand" : la main de poker (String)

La méthode doit retourner une chaine de caractère qui décrit le résultat de la partie.
Les mains de poker sont comparées en fonction de la valeur de retour de la méthode "to_s".

Pour simplifier la comparaison, on ne considèrera pas la valeur des cartes composant la combinaison. Exemple:
Une paire de 2 renverra "pair", une paire de 10 renverra également "pair".
Dans un jeu classique, on considèrera que la paire de 10 est supérieure à la paire de 2.
Pour simplifier cet exercice, on considère que les deux paires sont égales.
Dans ce cas la main la plus forte est alors celle qui a la carte la plus forte dans son jeu.
Si la carte la plus forte est la même alors on a une égalité.

Les valeurs de retour possibles sont :
- tie                                           - égalité
- <color> wins with <hand>                      - vainqueur par combinaison
- <color> wins with <hand> and kicker <kicker>  - vainqueur par combinaison et valeur de la carte la plus forte

La valeur des cartes est la suivante :
2 < 3 < 4 < 5 < 6 < 7 < 8 < 9 < T < J < Q < K < A

Pour cette 3ème étape, le candidat devra faire passer les tests du fichier poker_full_tests.rb