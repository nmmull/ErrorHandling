module E = struct
  type error = Bar_intf.error
  let plunk narrow_error = function
    | _, lst ->
       let coerced =
         (narrow_error : error :> Trace_intf.error)
       in Some narrow_error, coerced :: lst
end

module R = Trace.Make (E)


let is_two_or_error x =
  R.trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
