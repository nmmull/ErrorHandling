module Error = struct
  type error = Foo_intf.error
  let coerce e = (e : error :> Trace_intf.global_error)
end

module R = Trace.Make (Error)
let export = R.export

let is_two_or_error x =
  if x = 2
  then R.pure 2
  else R.new_error (`NotGood "Not given 2")
