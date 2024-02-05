type ('a, 'e) trace = ('a, 'e) Trace_intf.trace

module type COERCE = sig
  type error
  val coerce : error -> Trace_intf.global_error
end

module Make (C : COERCE) = struct
  module ErrList = struct
    type t = C.error * Trace_intf.global_error list
  end

  module R = Etude.Result.Make (ErrList)

  let expose = function
    | Ok o -> Ok o
    | Error (_,lst) -> Error lst
    
  let pure = R.pure

  let new_error e = Error (e, [C.coerce e])

  let trycatch 
    = fun new_err x -> match x with
    | Ok o -> Ok o
    | Error (_, errs) ->
         Error (new_err, C.coerce new_err :: errs)
end
