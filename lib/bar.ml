type error = Trace_intf.error

type ('a, 'b, 'c) full_error = ('a, 'b, 'c) Trace_intf.full_error

let is_two_or_error x =
  let open Trace in
  withError
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
