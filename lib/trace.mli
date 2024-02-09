module Errlist : sig type t end

module type TRACE = Trace_intf.TRACE

module T : TRACE
       with type 'a trace = ('a, Errlist.t) result

module Specialize :
functor (E : sig type error end) ->
sig
  type 'a trycatch = E.error ->
                     ('a, Errlist.t) result ->
                     ('a, Errlist.t) result
  type 'a new_error = E.error ->
                      ('a, Errlist.t) result
end

val export : ('a, Errlist.t) result ->
             ('a, Trace_intf.Errlist.t) result
