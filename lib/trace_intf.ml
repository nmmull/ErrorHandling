type error = [
  | Bar_intf.error
  | Foo_intf.error
]

type ('a, 'b, 'c) full_error = ('a, 'b) result * 'c list
