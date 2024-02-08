module Errlist = Trace_intf.Errlist

module type TRACE = sig
  type 'a trace
  val new_error : [< Trace_intf.global_error ] -> ('a, Errlist.t) result
  val trycatch : [< Trace_intf.global_error ] -> ('a, Errlist.t) result -> ('a, Errlist.t) result
end

module Make (C : Trace_intf.COERCE) =
  struct
    type 'a trace = ('a, Trace_intf.Errlist.t) result
    let new_error e = Error [(e : [< Trace_intf.global_error ] :> Trace_intf.global_error)]
    let trycatch e = function
      | Ok _ as o -> o
      | Error lst -> Error ((e : [< Trace_intf.global_error ] :> Trace_intf.global_error) :: lst)
  end

let export = Fun.id
