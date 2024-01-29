type error = Foo_intf.error

type ('a, 'b, 'c) full_error = ('a, 'b, 'c) Trace_intf.full_error

let is_two_or_error x =
  let open Trace in
  if x = 2
  then pure ()
  else throw (`NotGood "Not given 2")
