type global_error = [
  | Bar_intf.error
  | Foo_intf.error
  ]

module Errlist = struct
  type t = global_error list
end

module type COERCE = sig
  type error
end
