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

module type TRACE = sig
  type 'a trace
  val new_error : [< global_error ] -> 'a trace
  val trycatch : [< global_error ] -> 'a trace -> 'a trace
end
