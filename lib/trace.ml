type error = [
  | Bar_intf.error
  | Foo_intf.error
  ]

let coerce e = (e : error :> [> error])

let pure x = Ok x

let mk_error e =
  Error [coerce e]

let trycatch e x =
  match x with
  | Ok _ -> x
  | Error errs -> Error (coerce e :: errs)
