Le but de ce kata est de créer un programme qui permet de comparer deux mains de poker et de déterminer laquelle est
la plus forte. Pour l'exercice on considerera qu'une main de poker est composée de 5 cartes. Les mains seront passées
au programme sous forme de chaine de caractère, chaque carte étant séparée par un espace.
Le point d'entrée du code est le fichier poker.rb

Dans un premier temps le candidat devra valider la main de poker en entrée.
Les cartes sont représentées par une chaine de caractère de deux caractères.
Le premier caractère représente la valeur de la carte (2, 3, 4, 5, 6, 7, 8, 9, T, J, Q, K ou A).
T = 10, J = Valet, Q = Dame, K = Roi, A = As
Le second caractère représente la couleur de la carte (s, h, d ou c).
s = Spades (Pique), h = Hearts (Coeur), d = Diamonds (Carreau), c = Clubs (Trèfle)

Exemple de main: Jc Qh 9s 2h 3d
Jc = Valet de Trèfle, Qh = Dame de Coeur, 9s = 9 de Pique, 2h = 2 de Coeur, 3d = 3 de Carreau

Dans un second temps le candidat devra implémenter la méthode "name" de la classe Hand qui prend en paramètre
une main de poker et retourne un symbole qui décrit la main.
Les mains possibles sont les suivantes, de la plus faible à la plus forte:
- :nothing         - aucune combinaison
- :pair            - 1 paire               - 2 cartes de même valeur
- :two_pairs       - 2 paires              - 2 cartes de même valeur et 2 autres cartes de même valeur
- :three_of_a_kind - brelan                - 3 cartes de même valeur
- :straight        - suite                 - 5 cartes de valeurs qui se suivent
- :flush           - couleur               - 5 cartes de la même couleur
- :full_house      - full                  - 1 paire et 1 brelan
- :four_of_a_kind  - carré                 - 4 cartes de même valeur
- :straight_flush  - quinte flush          - suite et couleur en même temps
- :royal_flush     - quinte flush royale   - suite la plus forte et couleur

Pour ces 2 premières étapes, le candidat devra faire passer les tests du fichier poker_hand_test.rb
