type error = Foo_intf.error

val is_two_or_error :
  int -> (int, Trace.error list) result
