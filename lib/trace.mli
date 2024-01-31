open Trace_intf

val pure :
  'a -> ('a, error list) result

val trycatch :
  error ->
  ('a, error list) result ->
  ('a, error list) result
