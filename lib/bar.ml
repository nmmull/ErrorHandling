type error = Bar_intf.error

let is_two_or_error x =
  let open Trace in
  withError
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
