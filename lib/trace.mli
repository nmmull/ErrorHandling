type ('a, 'e) trace

module Make : functor (C : Trace_intf.COERCE) ->
  sig
    val export : ('a, 'b) trace ->
                 ('a, Trace_intf.error list) result
    val pure : 'a -> ('a, C.error) trace
    val new_error : C.error -> ('a, C.error) trace
    val trycatch : C.error -> ('a, 'b) trace -> ('a, C.error) trace
  end
