module Errlist = Trace_intf.Errlist

module type TRACE = Trace_intf.TRACE

module Make (C : Trace_intf.COERCE) : TRACE with type 'a trace = ('a, Errlist.t) result =
  struct
    type 'a trace = ('a, Trace_intf.Errlist.t) result
    let new_error e = Error [(e : [< Trace_intf.global_error ] :> Trace_intf.global_error)]
    let trycatch e = function
      | Ok _ as o -> o
      | Error lst -> Error ((e : [< Trace_intf.global_error ] :> Trace_intf.global_error) :: lst)
  end

let export = Fun.id
