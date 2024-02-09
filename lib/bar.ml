type 'a trycatch = 'a Trace.Specialize(Bar_intf).trycatch

let trycatch : 'a trycatch = Trace.T.trycatch

let is_two_or_error x =
  trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
