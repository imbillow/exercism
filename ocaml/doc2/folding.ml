type 'a susp = Susp of (unit -> 'a)

type 'a str = {
  hd: 'a;
  tl: ('a str) susp}

let force (Susp f) = f ()

let rec fold f s a0 =
  {
    hd = f s.hd a0;
    tl = Susp (fun () -> fold f (force s.tl) (f s.hd a0)) }


let rec ones = {hd=1;tl=Susp(fun () -> ones)}

let nats = fold (+) ones 0

let triangular_numbers =
  fold (+)
    nats
    0

let goebels_series =
  let square n = n*n in
  let rec goebels xs n =
    {hd= xs / n;
     tl=Susp (fun () -> goebels (xs + (square (xs/n))) (n+1) )}
  in
  {hd = 1;
   tl = Susp (fun () -> goebels 2 1)}


(* let rec ones = {hd = 1; tl = Susp (fun () -> ones)} *)

let psums xs = fold (+) xs 0

let rec map f xs =
  {
    hd = f xs.hd;
    tl = Susp (fun () -> map f (force xs.tl))
  }

let rec stake n s =
  if n = 0 then []
  else s.hd :: stake (n - 1) (force s.tl)


let rec pascal =
  {
    hd = ones;
    tl = Susp (fun () -> map psums pascal)
  }

let rec getNth n s =
  match n with
  | 0 -> s.hd
  | n -> getNth (n-1) (force s.tl)

let rec row (k:int) (s:(int str) str) =
  let rec aux n k s =
    if k = 0 then
      [1]
    else
      getNth k (getNth n s) :: aux (n+1) (k-1) s
    in
    aux 0 k s

let triangle =
  let rec aux k s =
    {hd = row k s;
     tl = Susp (fun () -> aux (k+1) s)}
  in
  aux 0 pascal
