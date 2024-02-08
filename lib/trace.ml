module Errlist = Trace_intf.Errlist

module Make (C : Trace_intf.COERCE) =
  struct
    (* type error = C.error *)
    type 'a trace = ('a, Trace_intf.Errlist.t) result
    let new_error e = Error [(e : [< Trace_intf.global_error ] :> Trace_intf.global_error)]
    let trycatch e = function
      | Ok _ as o -> o
      | Error lst -> Error ((e : [< Trace_intf.global_error ] :> Trace_intf.global_error) :: lst)
  end

let export = Fun.id
