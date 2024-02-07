module Error = struct
  type error = Bar_intf.error
  let coerce e = (e : error :> Trace_intf.global_error)
end

module T = Trace.Make (Error)

let is_two_or_error x =
  let open T in
  trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
