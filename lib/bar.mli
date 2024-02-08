module T : sig
  type 'a trace = ('a, Trace.Errlist.t) result
  val new_error :
    Bar_intf.error -> ('a, Trace.Errlist.t) result
  val trycatch :
    Bar_intf.error ->
    ('a, Trace.Errlist.t) result -> ('a, Trace.Errlist.t) result
end

val is_two_or_error : int -> (int, Trace.Errlist.t) result
