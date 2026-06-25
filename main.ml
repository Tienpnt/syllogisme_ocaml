#use "syllogisme.ml";;

(* Fonction principale pour créer le syllogisme *)
let syllogisme_general (p_y, p_x, p_z, p_syl: string * string * string * string) : unit =
  let l_type_syl = trans_syl_to_type (p_syl)
  and (l_prem1_s, l_prem1_p, l_prem2_s, l_prem2_p, l_conc_s, l_conc_p): (string * string * string * string * string * string) =
   get_roles (p_syl, p_x, p_y, p_z) in 
    let l_prem1 = phrase_of_quant (l_type_syl.p_p1, l_prem1_s, l_prem1_p)
    and l_prem2 = phrase_of_quant (l_type_syl.p_p2, l_prem2_s, l_prem2_p)
    and l_conclusion = phrase_of_quant (l_type_syl.p_c, l_conc_s, l_conc_p) in
  (* Affichage du syllogisme *)
  print_endline (String.capitalize_ascii (l_prem1) ^ ", or " ^ l_prem2 ^ ", donc " ^ l_conclusion ^ ".")
;;

(*les termes Y: Chat, X: felin, Z: Siammois,  bArbArA. 
Donc, On a Figure 1 et P1: YX, P2: YZ, C: ZX *)
syllogisme_general ("Chat", "felin", "Siammois", "bArbArA");;
