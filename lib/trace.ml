type error = Trace_intf.error

module E = struct type t = error list end

include Etude.Result.Make (E)

module type ERROR = sig
  type t
  val coerce : t -> error
end

module Make (Err : ERROR) = struct
  type ('a, 'error) t = ('a, 'error * error list) result

  module ErrList = struct
    type t = Err.t * error list
  end

  module R = Etude.Result.Make (ErrList)

  (* let to_list (e_head, e_tail) = *)
  (*   Err.coerce e_head :: e_tail *)

  let export = function
    | Ok o -> Ok o
    | Error (_,lst) -> Error lst

  let new_error e = Error (e, [Err.coerce e])

  let pure x = Ok x

  let trycatch e x =
    match x with
    | Ok _ -> x
    | Error (_, lst) ->
       Error (e, Err.coerce e :: lst)
end

(* let trycatch 
 *   = fun e x ->
 *   match x with
 *   | Ok _ -> x
 *   | Error (_, errs) ->
 *      let coerced = (e : 'error :> error)
 *      in Error (e, coerced :: errs) *)
