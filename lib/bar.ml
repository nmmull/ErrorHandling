type error = Bar_intf.error

let is_two_or_error x =
  let open Trace in
  let err = (`BadBad "Foo function failed"
             : error :> Trace_intf.error)
  in
  trycatch err (Foo.is_two_or_error x)
