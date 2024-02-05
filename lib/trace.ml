module type ERROR = sig
  type error
  val plunk : error ->
              'a option * Trace_intf.error list ->
              error option * Trace_intf.error list
end

type error = Trace_intf.error

module Make (Err : ERROR) = struct
  type ('a, 'error) t = ('a, 'error option * error list) result

  module ErrList = struct
    type t = Err.error option * error list
  end

  module R = Etude.Result.Make (ErrList)

  let export = function
    | Ok o -> Ok o
    | Error (_,lst) -> Error lst
  
  let new_error e =
    Error (Err.plunk e (None, []))

  let polymorphify (_, lst) = None, lst
  
  let pure = R.pure
  
  let trycatch 
      : Err.error -> ('a, 'b) t -> ('a, Err.error) t
    =
    fun new_err x ->
    (* new_err x *)
    (* = *)
    match x with
    | Ok _ -> x
    | Error errs ->
       let poly = polymorphify errs in
       Error (Err.plunk new_err poly)

end
