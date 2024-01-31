type error = Foo_intf.error

let message = Foo_intf.message

let coerce e = (e : error :> Trace_intf.error)

let mk_error e = Error [coerce e]

let is_two_or_error x =
  if x = 2
  then Trace.pure x
  else mk_error (`NotGood "Not given 2")
