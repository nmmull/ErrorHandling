module T = Trace.Make (Foo_intf)
module R = Etude.Result.Make (Trace.Errlist)

let is_two_or_error x =
  let open T in
  let open R in
  if x = 2
  then pure 2
  else new_error (`NotGood "Not given 2")
