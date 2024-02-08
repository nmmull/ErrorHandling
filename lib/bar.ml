module type HIDDEN = sig
  val trycatch : Bar_intf.error ->
                 ('a, Trace.Errlist.t) result ->
                 ('a, Trace.Errlist.t) result
end

module T : HIDDEN = Trace.Hide

let is_two_or_error x =
  let open T in
  trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
