module Errlist : sig type t end

module type TRACE = sig
  type 'a trace
  val new_error : [< Trace_intf.global_error ] -> ('a, Errlist.t) result
  val trycatch : [< Trace_intf.global_error ] -> ('a, Errlist.t) result -> ('a, Errlist.t) result
end

module Make : functor (_ : Trace_intf.COERCE) ->
              TRACE with type 'a trace = ('a, Errlist.t) result

val export : ('a, Errlist.t) result ->
             ('a, Trace_intf.Errlist.t) result
