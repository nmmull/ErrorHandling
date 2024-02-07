type global_error = [
  | Bar_intf.error
  | Foo_intf.error
  ]

module Errlist = struct
  type t = global_error list
end

type errlist = Errlist.t

module type COERCE = sig
  type error
  val coerce : error -> global_error
end

module type TRACE = sig
  type error
  val new_error : error -> ('a, errlist) result
  val trycatch : error ->
                 ('a, errlist) result ->
                 ('a, errlist) result
end

