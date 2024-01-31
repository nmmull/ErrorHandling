type error = Foo_intf.error

let is_two_or_error x =
  if x = 2
  then Trace.pure x
  else let err = (`NotGood "Not given 2"
                  : error :> Trace_intf.error)
       in Error [err]
