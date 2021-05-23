type 'a tree = Empty | Node of 'a tree * 'a * 'a tree

let rec find_subtree ls tree =
  match ls, tree with
  | [], _ -> tree
  | h::t , Node (left, x ,right) when h = x ->
    begin
      try find_subtree t left
      with Not_found -> find_subtree t right
    end
  | _ -> raise Not_found


type 'a option = None | Some of 'a


let find_subtree_cont ls tree =
  let rec aux_cont ls tree sc fc =
    match ls, tree with
    | [], _ -> sc tree
    | h::t , Node (left, v ,right) when h = v ->
        let sc2 = fun r -> sc r in
        let fc2 = fun () -> aux_cont t right sc fc in
        aux_cont t left sc2 fc2
    | _ -> fc ()
  in
  aux_cont ls tree (fun x -> Some x) (fun () -> None)


  let tree = Node (Node (Node (Empty,'c',Empty),'b',Node (Empty,'d',Empty)),'a',Node (Empty,'e',Empty))