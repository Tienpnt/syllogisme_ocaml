## Membres du groupe :
- "KOMLAN NUSUGAN" <komlan.nusugan@etu.univ-poitiers.fr>
- "LOÏC EDOH" <loic.edoh@etu.univ-poitiers.fr>
- "NGUYEN THUY TIEN PHAM" <nguyen.thuy.tien.pham@etu.univ-poitiers.fr>

## Sujet :
Éditeur de syllogismes. Ce programme permet d'analyser un syllogisme en demandant deux prémisses, une conclusion et un terme aristotélicien, puis il renvoie le syllogisme associé sous une forme logique correcte. Par exemple, pour les entrées : "Chat", "felin", "Siamois" et "bArbArA", le programme produit le syllogisme suivant :

Tout Chat est félin, or tout Siamois est Chat, donc tout Siamois est félin.

---

# Description des fonctions principales du code :

1. t_figure
   Ce type représente les différentes figures possibles d'un syllogisme : Figure1, Figure2, Figure3, Figure4.

2. t_type_syl
   Ce type représente les types de propositions dans un syllogisme sous forme de trois caractères : A, E, I, ou O.

3. syl
   Fonction qui détermine la figure d'un syllogisme à partir de son nom aristotélicien. Elle compare la chaîne d'entrée avec une liste de syllogismes prédéfinis et renvoie la figure correspondante.

4. get_roles
   Fonction qui détermine les rôles des termes (sujet, prédicat, conclusion) en fonction de la figure du syllogisme. Elle renvoie les termes dans l'ordre correct pour chaque figure.

5. string_get_basic
   Fonction auxiliaire permettant de récupérer un caractère d'une chaîne à une position donnée. Elle vérifie si l'indice est valide et récupère le caractère correspondant.

6. trans_syl_to_type
   Fonction qui transforme une chaîne syllogistique en un record de type t_type_syl, extrayant les trois propositions (A, E, I, O) et les stockant dans un record structuré.

7. phrase_of_quant
   Fonction qui génère une phrase naturelle correspondant à une proposition logique donnée, en fonction du quantificateur (A, E, I, ou O) et des termes associés.

8. syllogisme_general
   Fonction principale qui construit et affiche le syllogisme complet. Elle prend en entrée le nom du syllogisme, ainsi que les termes du syllogisme (sujet, prédicat, conclusion), et génère une phrase logique correcte, en respectant les règles du syllogisme.

---

##  Résultats obtenus :

Le programme permet de :
- Reconnaître automatiquement la figure d'un syllogisme.
- Extraire les propositions (A, E, I, O) de la chaîne de syllogisme.
- Générer une phrase logique correcte, respectant les règles des syllogismes d'Aristote.

# Exemple de sortie :
Pour le syllogisme bArbArA et les termes suivants :
- x = Chat
- y = félin
- z = Siamois

# La sortie sera la suivante :
Tout Chat est félin, or tout Siamois est Chat, donc tout Siamois est félin.

![Syllogisme Barbara](images/Resultats.png)
![Syllogisme Barbara](images/Res_terminal.png)

---
\\wsl.localhost\Ubuntu\home\npham03\Projet_OD06OS_Komlan_Loic_Tien

## Instructions d’utilisation :

1. Compiler le programme OCaml :
   Pour compiler, utilisez une commande comme :
   ocamlc -o syllogisme syllogisme.ml

2. Exécuter la fonction syllogisme_general :
   Appeler la fonction principale avec les arguments nécessaires :
   syllogisme_general ("bArbArA", "Chat", "felin", "Siamois")

3. Lire la phrase résultante :
   Le programme affichera le syllogisme sous une forme correcte en français dans la console.

---

## Remarques :
- La chaîne de syllogisme (p_syl) doit contenir exactement trois lettres majuscules parmi A, E, I, et O.
- Le programme lèvera une exception (failwith) si la figure n’est pas reconnue ou si la chaîne ne correspond pas à une forme correcte.
- Les termes (sujet, prédicat, conclusion) doivent être fournis sous forme de chaînes de caractères valides.

```ocaml
syllogisme_general ("Chat", "felin", "Siamois", "bArbArA")