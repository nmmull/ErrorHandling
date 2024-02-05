type global_error = [
  | Bar_intf.error
  | Foo_intf.error
  ]

type ('a, 'e) trace = ('a, 'e * global_error list) result

module type COERCE = sig
  type error
  val coerce : error -> global_error
end

module type MAKE = functor (C : COERCE) ->
  sig
    val expose : ('a, 'b) trace ->
                 ('a, global_error list) result
    val pure : 'a -> ('a, C.error) trace
    val new_error : C.error -> ('a, C.error) trace
    val trycatch : C.error -> ('a, 'b) trace -> ('a, C.error) trace
  end
