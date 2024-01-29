type ('a, 'e, 'w) t = ('a, 'e) result * 'w list

type error = [
  | Bar_intf.error
  | Foo_intf.error
]
