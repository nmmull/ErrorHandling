module type ERR = sig type error end

module Specialize (E : ERR) = struct
  type 'a trycatch = E.error -> ('a, Trace.Errlist.t) result -> ('a, Trace.Errlist.t) result
  end

type 'a trycatch = 'a Specialize(Bar_intf).trycatch

let trycatch : 'a trycatch = Trace.T.trycatch

let is_two_or_error x =
  trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
