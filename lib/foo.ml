module E = struct
  type t = Foo_intf.error
  let coerce e = (e : t :> Trace.error)
end

module R = Trace.Make (E)

let is_two_or_error x =
  if x = 2
  then R.pure x
  else R.new_error (`NotGood "Not given 2")
