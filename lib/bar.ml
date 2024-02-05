module Error = struct
  type error = Bar_intf.error
  let coerce e = (e : error :> Trace_intf.error)
end

module R = Trace.Make (Error)

(* let trycatch 
 *   = fun new_err x -> match x with
 *                      | Ok o -> Ok o
 *                      | Error (_, errs) ->
 *                         Error (new_err, Error.coerce new_err :: errs) *)

let is_two_or_error x =
  R.trycatch
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)

(* let is_two_or_error x = match x with
 *   | Ok o -> Ok o
 *   | Error (_, errs) ->
 *      Error (`BadBad "Error in Foo Function" , Error.coerce (`BadBad "Error in Foo function") :: errs) *)
