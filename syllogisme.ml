(* Type représentant les différentes figures possibles d'un syllogisme (Figure1, Figure2, Figure3, Figure4). *)
type t_figure = Figure1 | Figure2 | Figure3 | Figure4;;

(* Type représentant les types de propositions A, E, I, O dans un syllogisme. *)
type t_type_syl = {p_p1: char; p_p2: char; p_c: char};;


(* Fonction pour déterminer la figure du syllogisme à partir d'une chaîne donnée. *)
let syl (p_syl: string): t_figure =
  if p_syl = "bArbArA" || p_syl = "cElArEnt" || p_syl = "dArII"|| p_syl = "fErIO" then Figure1
      else if p_syl = "cEsArE"|| p_syl = "cAmEstrEs"|| p_syl = "fEstInO"|| p_syl = "bArOkO" then Figure2
         else if p_syl = "dArAptI"|| p_syl =  "dIsAmIs"|| p_syl = "dAtIsI"|| p_syl = "fElAptOn"|| p_syl = "bOkArdO"|| p_syl = "fErIsO" then Figure3
            else if p_syl = "brAmAntIp"|| p_syl = "cAmEnEs"|| p_syl = "dImArIs"|| p_syl = "fEsApO"|| p_syl = "frEsIsOn" then Figure4
                else failwith "erreur"
;;

(* Fonction pour obtenir les rôles en fonction de la figure donnée *)
let get_roles (p_syl, p_x, p_y, p_z: string * string * string * string): string * string * string * string * string * string =
    if syl(p_syl) = Figure1 then (p_y, p_x, p_z, p_y, p_z, p_x)
    else if syl(p_syl) = Figure2 then (p_x, p_y, p_z, p_y, p_z, p_x)
    else if syl(p_syl) = Figure3 then (p_y, p_x, p_y, p_z, p_z, p_x)
    else if syl(p_syl) = Figure4 then (p_x, p_y, p_y, p_z, p_z, p_x)
    else failwith "Erreur: Figure inconnue ou mal formée"  (* Cas d'erreur si figure n'est pas trouvée *)
;;
get_roles

(* Fonction qui récupère un caractère dans une chaîne à partir d'un indice donné *)
let string_get_basic (p_s, p_i: string * int) : char =
  let l_len: int = String.length (p_s) in 

  (* Vérification si l'indice est valide (entre 0 et la longueur de la chaîne - 1) *)
  if p_i < 0 || p_i >= l_len then
    failwith "string_get_basic: out of bounds"
  else
    (* Fonction récursive pour parcourir la chaîne et trouver le caractère à l'indice p_i *)
    let rec l_loop (l_j: int) : char = 
      (* Si l'indice dépasse la longueur de la chaîne, on lève une exception *)
      if l_j = l_len then
        failwith "Erreur : indice invalide dans la boucle"  (* Erreur si l'indice est invalide dans la boucle *)

      (* Si l'indice courant correspond à p_i, on retourne le caractère à cet indice *)
      else if l_j = p_i then
        p_s.[l_j]  

      (* Si l'indice courant n'est pas égal à p_i, on continue la boucle avec l'indice suivant *)
      else
        l_loop (l_j + 1) 
    in
    (* On commence la boucle avec l'indice initial 0 *)
    l_loop (0)
;;


(* Fonction pour convertir une chaîne de syllogisme en un record structuré avec trois types de propositions. *)
let trans_syl_to_type (p_syl: string): t_type_syl =
  if syl(p_syl) = Figure1 || syl(p_syl) = Figure2 || syl(p_syl) = Figure3 || syl(p_syl) = Figure4 then
  let rec l_collect_upper (p_lst, p_index: char list * int) : char list =
    if p_index >= String.length (p_syl) then p_lst
    else
      let l_c : char = string_get_basic (p_syl, p_index) in
        if l_c = 'A' || l_c = 'E' || l_c = 'I' || l_c = 'O' then
          l_collect_upper ((p_lst @ [l_c]), p_index + 1)
        else
          l_collect_upper (p_lst, p_index + 1)
  in
    let l_upper_list = l_collect_upper ([], 0) 
    in
      if List.length (l_upper_list) = 3 then
        let l_p1: char = List.nth l_upper_list 0
        and l_p2: char = List.nth l_upper_list 1
        and l_c: char = List.nth l_upper_list 2 
        in
          {p_p1 = l_p1; p_p2 = l_p2; p_c = l_c} 
      else    
          failwith "Syllogism string does not contain exactly three valid proposition types"
  else
    failwith "Invalid syllogism figure"
;;

  (* Fonction pour créer la phrase en fonction du quantificateur *)    
let phrase_of_quant (p_q, p_sujet, p_predicat: char * string * string): string =
    if p_q = 'A' then "tout " ^ p_sujet ^ " est " ^ p_predicat
    else if p_q = 'E' then "aucun " ^ p_sujet ^ " n'est " ^ p_predicat
    else if p_q = 'I' then "certains " ^ p_sujet ^ " sont " ^ p_predicat
    else if p_q = 'O' then "certains " ^ p_sujet ^ " ne sont pas " ^ p_predicat
    else "Quantificateur inconnu"
;;



