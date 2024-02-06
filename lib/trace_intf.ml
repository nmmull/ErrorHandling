type global_error = [
  | Bar_intf.error
  | Foo_intf.error
  ]

module type COERCE = sig
  type error
  val coerce : error -> global_error
end

type 'e errlist = 'e * global_error list
type ('a, 'e) trace = ('a, 'e errlist) result
