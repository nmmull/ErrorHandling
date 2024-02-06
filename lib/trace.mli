type 'e errlist
type ('a, 'e) trace = ('a, 'e errlist) result

module Make : functor (C : Trace_intf.COERCE) ->
  sig
    val export : ('a, 'b) trace ->
                 ('a, Trace_intf.global_error list) result
    val new_error : C.error -> ('a, C.error) trace
    val trycatch : C.error -> ('a, 'b) trace -> ('a, C.error) trace
    val pure : 'a -> ('a, C.error) trace
    module ErrList : sig
      type t = C.error * Trace_intf.global_error list
    end
  end
