type error = Foo_intf.error

val message : error -> string

val is_two_or_error :
  int -> (int, Trace_intf.error list) result
