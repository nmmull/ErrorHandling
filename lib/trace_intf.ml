type global_error = [
  | Bar_intf.error
  | Foo_intf.error
  ]

module Errlist = struct
  type t = global_error list
end

module type COERCE = sig
  type error
  (* val coerce : error -> global_error *)
end

module type TRACE = sig
  (* type error *)
  type 'a trace
  val new_error : [< global_error ] -> ('a, Errlist.t) result
  val trycatch : [< global_error ] -> ('a, Errlist.t) result -> ('a, Errlist.t) result
end
