type error = Foo_intf.error

let mk_error e =
  let coerced = (e : error :> Trace_intf.error)
  in Error [coerced]

let is_two_or_error x =
  if x = 2
  then Trace.pure x
  else mk_error (`NotGood "Not given 2")
