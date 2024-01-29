type error = Foo_intf.error

type ('a, 'b, 'c) full_error = ('a, 'b, 'c) Trace_intf.full_error

val is_two_or_error :
  int -> (unit, Trace_intf.error, [> Trace_intf.error ]) full_error 
