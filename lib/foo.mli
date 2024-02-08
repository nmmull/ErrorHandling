module T : sig
  val trycatch : [< Trace_intf.global_error ] ->
                 ('a, Trace_intf.global_error list) result ->
                 ('a, Trace_intf.global_error list) result
end

val is_two_or_error : int -> (int, Trace.Errlist.t) result
