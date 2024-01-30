type error = Bar_intf.error

let mk_error e =
  Error [(e : error :> [> error ])]

let is_two_or_error x =
  let open Trace in
  trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
