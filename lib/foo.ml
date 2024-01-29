type error = Foo_intf.error

let is_two_or_error x =
  let open Trace in
  if x = 2
  then pure ()
  else throw (`NotGood "Not given 2")
