type 'a errlist = 'a Trace_intf.errlist
type ('a, 'e) trace = ('a, 'e errlist) result

module type COERCE = Trace_intf.COERCE

module Make (C : COERCE) = struct

  module ErrList = struct
    type t = C.error errlist
  end

  module R = Etude.Result.Make (ErrList)
  include R

  let export = function
    | Ok o -> Ok o
    | Error (_,lst) -> Error lst
    
  let pure = R.pure

  let new_error e = Error (e, [C.coerce e])

  let trycatch new_err = function
    | Ok o -> Ok o
    | Error (_, errs) ->
         Error (new_err, C.coerce new_err :: errs)
end
