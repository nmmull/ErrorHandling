module type PLUNK = sig
  type error
  val plunk : error ->
              'a option * Trace_intf.error list ->
              error option * Trace_intf.error list
end

module type ERROR = sig
  type error
end

type error = Trace_intf.error

module Make (Narrow : PLUNK) (Wide : ERROR) = struct
  type ('a, 'error) t = ('a, 'error option * error list) result

  module ErrList = struct
    type t = Narrow.error option * error list
  end

  module R = Etude.Result.Make (ErrList)

  let export = function
    | Ok o -> Ok o
    | Error (_,lst) -> Error lst
  
  let new_error e =
    Error (Narrow.plunk e (None, []))

  let polymorphify (_, lst) = None, lst
  
  let pure = R.pure
  
  let trycatch 
      : Narrow.error -> ('a, 'b) t -> ('a, Narrow.error) t
    =
    fun new_err x ->
    (* new_err x *)
    (* = *)
    match x with
    | Ok _ -> x
    | Error errs ->
       let poly = polymorphify errs in
       Error (Narrow.plunk new_err poly)

end
