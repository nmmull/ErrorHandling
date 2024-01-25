type error = Bar_intf.error

let serializer e = (e : error :> [> error])

let is_two_or_error x =
  let open Trace in
  withError
    ~serializer
    (`BadBad "Foo function failed")
    (Foo.is_two_or_error x)
