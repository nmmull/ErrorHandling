module type HIDDEN = sig
  val new_error : Foo_intf.error ->
                  ('a, Trace.Errlist.t) result
end

module T : HIDDEN = Trace.T
module R = Etude.Result.Make (Trace.Errlist)

let is_two_or_error x =
  let open T in
  let open R in
  if x = 2
  then pure 2
  else new_error (`NotGood "Not given 2")
