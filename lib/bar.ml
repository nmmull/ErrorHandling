type error = Bar_intf.error

(* let trycatch *)
(*   : error -> ('a, error) Trace.t -> ('a, error) Trace.t *)
(*   = fun e x -> *)
(*   match x with *)
(*   | Ok _ -> x *)
(*   | Error (_, errs) -> *)
(*      let coerced = (e : 'error :> error) *)
(*      in Error (e, coerced :: errs) *)

let trycatch e x =
  match x with
  | Ok _ -> x
  | Error errs ->
     let coerced = (e : error :> Trace_intf.error)
     in Error (coerced :: errs)

let is_two_or_error x =
  let err = `BadBad "Foo function failed" in
  trycatch err (Foo.is_two_or_error x)
