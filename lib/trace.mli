module Errlist : sig type t end

module Make : functor (_ : Trace_intf.COERCE) ->
              Trace_intf.TRACE
              (* with type error = C.error *)
               with type 'a trace = ('a, Errlist.t) result

val export : ('a, Errlist.t) result ->
             ('a, Trace_intf.Errlist.t) result
