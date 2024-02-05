module Error = struct
  type error = Bar_intf.error
  let coerce e = (e : error :> Trace_intf.error)
end

module R = Trace.Make (Error)
let export = R.export

let is_two_or_error x =
  R.trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
