module Errlist = Trace_intf.Errlist

(* module type TRACE = sig
 *   type 'a trace
 *   val new_error : [< Trace_intf.global_error ] -> 'a trace
 *   val trycatch : [< Trace_intf.global_error ] -> 'a trace -> 'a trace
 * end *)

module type TRACE = Trace_intf.TRACE

module Make (C : Trace_intf.COERCE) =
  struct
    type 'a trace = ('a, Trace_intf.Errlist.t) result
    let new_error e = Error [(e : [< Trace_intf.global_error ] :> Trace_intf.global_error)]
    let trycatch e = function
      | Ok _ as o -> o
      | Error lst -> Error ((e : [< Trace_intf.global_error ] :> Trace_intf.global_error) :: lst)
  end

let export = Fun.id
