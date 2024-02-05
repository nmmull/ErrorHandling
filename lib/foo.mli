val expose : ('a, 'b) Trace_intf.trace ->
             ('a, Trace_intf.global_error list) result

val is_two_or_error :
  int -> (int, Foo_intf.error) Trace_intf.trace
