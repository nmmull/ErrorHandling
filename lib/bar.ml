

(* let trycatch *)
(*   : error -> ('a, error) Trace.t -> ('a, error) Trace.t *)
(*   = fun e x -> *)
(*   match x with *)
(*   | Ok _ -> x *)
(*   | Error (_, errs) -> *)
(*      let coerced = (e : 'error :> error) *)
(*      in Error (e, coerced :: errs) *)

module E = struct
  type t = Bar_intf.error
  let coerce e = (e : t :> Trace.error)
end

(* let trycatch e x = *)
(*   match x with *)
(*   | Ok _ -> x *)
(*   | Error errs -> *)
(*      let coerced = (e : E.t :> Trace_intf.error) *)
(*      in Error (coerced :: errs) *)


module R = Trace.Make (E)

let is_two_or_error x =
  let err = `BadBad "Foo function failed" in
  R.trycatch err (Foo.is_two_or_error x)
