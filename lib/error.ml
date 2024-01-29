type t = [
  | Foo_intf.error
  | Bar_intf.error
]

type ('a , 'e) trace = ('a , 'e, t) Trace.t


