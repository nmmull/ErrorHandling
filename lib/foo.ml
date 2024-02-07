module Error = struct
  type error = Foo_intf.error
  let coerce e = (e : error :> Trace_intf.global_error)
end

let is_two_or_error x =
  let open Trace.Make (Error) in
  if x = 2
  then Ok 2
  else new_error (`NotGood "Not given 2")
