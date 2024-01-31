include Etude.Endofunctors_intf.MONAD
        with type 'a t := ('a, Trace_intf.error list) result

open Trace_intf

val trycatch :
  error ->
  ('a, error list) result ->
  ('a, error list) result
