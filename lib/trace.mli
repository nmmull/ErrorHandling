type error = [
  | Bar_intf.error
  | Foo_intf.error
  ]

val pure :
  'a -> ('a, [> error ] list) result

val trycatch :
  error ->
  ('a, ([> error ] as 'b) list) result ->
  ('a, 'b list) result
