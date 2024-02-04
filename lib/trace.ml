type error = Trace_intf.error

module E = struct
  type t = error list
end

include Etude.Result.Make (E)

type ('a, +'error) t = ('a, 'error * error list) result

(* let trycatch 
 *   = fun e x ->
 *   match x with
 *   | Ok _ -> x
 *   | Error (_, errs) ->
 *      let coerced = (e : 'error :> error)
 *      in Error (e, coerced :: errs) *)
