type error = Bar_intf.error

let trycatch e x =
  match x with
  | Ok _ -> x
  | Error errs ->
     let coerced = (e : error :> Trace_intf.error)
     in Error (coerced :: errs)

let is_two_or_error x =
  let err = `BadBad "Foo function failed" in
  trycatch err (Foo.is_two_or_error x)
