module T = Trace.Make (Bar_intf)

let is_two_or_error x =
  let open T in
  trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
