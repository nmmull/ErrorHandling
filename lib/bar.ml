type error = Bar_intf.error

let coerce e = (e : error :> Trace_intf.error)

let is_two_or_error x =
  let open Trace in
  let err = coerce (`BadBad "Foo function failed") in
  trycatch err (Foo.is_two_or_error x)
