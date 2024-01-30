type error = Foo_intf.error

let mk_error e =
  Error [(e : error :> [> error ])]

let is_two_or_error x =
  if x = 2
  then Trace.pure x
  else mk_error (`NotGood "Not given 2")
