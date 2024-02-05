module type COERCE = sig
  type error
  val coerce : error -> Trace_intf.error
end

module Make : functor (C : COERCE) ->
  sig
    type ('a, 'e) trace = ('a, 'e * Trace_intf.error list) result
    val export : ('a, 'b * 'c) result -> ('a, 'c) result
    val pure : 'a -> ('a, C.error) trace
    val new_error : C.error -> ('a, C.error) trace
    val trycatch :
      C.error ->
      ('a, 'b) trace ->
      ('a, C.error) trace
  end
