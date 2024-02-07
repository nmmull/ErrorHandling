module Error = struct
  type error = Bar_intf.error
  let coerce e = (e : error :> Trace_intf.global_error)
end

let is_two_or_error x =
  let open Trace.Make (Error) in
  trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
