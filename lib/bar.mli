type error = Bar_intf.error

val trycatch : error -> ('a, error) Trace.t -> ('a, error) Trace.t

val is_two_or_error :
  int -> (int, Trace.error list) result
