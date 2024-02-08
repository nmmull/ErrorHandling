module Errlist : sig type t end

module type TRACE = Trace_intf.TRACE

module Make : TRACE with type 'a trace = ('a, Errlist.t) result

val export : ('a, Errlist.t) result ->
             ('a, Trace_intf.Errlist.t) result
