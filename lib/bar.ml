module type LOCKITDOWN = sig
  val trycatch :
    Bar_intf.error ->
    ('a, Trace.Errlist.t) result -> ('a, Trace.Errlist.t) result
end

module T : LOCKITDOWN = Trace.Make (Bar_intf)

let is_two_or_error x =
  let open T in
  trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
