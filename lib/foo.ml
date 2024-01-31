type error = Foo_intf.error

let is_two_or_error x =
  if x = 2
  then Trace.pure x
  else let e = `NotGood "Not given 2" in
       Error [(e : error :> Trace_intf.error)]
