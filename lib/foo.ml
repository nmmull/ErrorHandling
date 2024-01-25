type error = Foo_intf.error

let serializer e = (e : error :> [> error])

let is_two_or_error x =
  let open Trace in
  if x = 2
  then pure ()
  else throw ~serializer (`NotGood "Not given 2")
