module Errlist : sig type t end

module Make :
functor (C : Trace_intf.COERCE) ->
Trace_intf.TRACE with type error = C.error
                  and type 'a trace = ('a, Errlist.t) result

val export : ('a, Errlist.t) result ->
             ('a, Trace_intf.Errlist.t) result
