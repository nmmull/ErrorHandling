type error = Foo_intf.error

val is_two_or_error :
  int -> (int, Trace_intf.error list) result
