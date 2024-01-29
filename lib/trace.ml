type ('a, 'e, 'w) t = ('a, 'e, 'w) Trace_intf.t

type error = Trace_intf.error

type ('a, 'b, 'c) full_error = ('a, 'b, 'c) Trace_intf.full_error

let serializer e = (e : error :> [> error])

let pure a = (Ok a, [])

let throw e = (Error e, [serializer e])

let bind (r, l) f =
  match r with
  | Ok v -> let (r', l') = f v in (r', l' @ l)
  | Error e -> (Error e, l)

let catch (r, l) f =
  match r with
  | Ok v -> (Ok v, l)
  | Error e -> let (r', l') = f e in (r', l' @ l)

let withError e x =
  catch x (fun _ -> throw e)
