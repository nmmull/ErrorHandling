type error = Trace_intf.error

type ('a, 'b, 'c) full_error = ('a, 'b, 'c) Trace_intf.full_error

val is_two_or_error :
  int -> (unit, error, [> error ]) full_error
