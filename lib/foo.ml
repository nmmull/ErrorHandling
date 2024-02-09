type 'a new_error = 'a Trace.Specialize(Foo_intf).new_error

let new_error : 'a new_error = Trace.T.new_error

let is_two_or_error x =
  let open Etude.Result.Make (Trace.Errlist) in
  if x = 2
  then pure 2
  else new_error (`NotGood "Not given 2")
