type global_error = [
  | Bar_intf.error
  | Foo_intf.error
  ]

module type COERCE = sig
  type error
  val coerce : error -> global_error
end

type error = global_error
