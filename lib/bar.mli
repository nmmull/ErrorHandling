type error = Bar_intf.error

val mk_error :
  error -> ('a, [> error ] list) result

val is_two_or_error :
  int -> (int, [> Trace.error ] list) result
