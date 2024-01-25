type ('a, 'e, 'w) t = ('a, 'e) result * 'w list

let pure a = (Ok a, [])

let throw ?serializer e =
  match serializer with
  | None -> (Error e, [])
  | Some f -> (Error e, [f e])

let bind (r, l) f =
  match r with
  | Ok v -> let (r', l') = f v in (r', l' @ l)
  | Error e -> (Error e, l)

let catch (r, l) f =
  match r with
  | Ok v -> (Ok v, l)
  | Error e -> let (r', l') = f e in (r', l' @ l)

let withError ?serializer e x =
  catch x (fun _ -> throw ?serializer:serializer e)
