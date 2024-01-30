type error = [
  | Bar_intf.error
  | Foo_intf.error
  ]

let pure x = Ok x

let trycatch e x =
  match x with
  | Ok _ -> x
  | Error errs ->
     let coerced = (e : error :> [> error ])
     in Error (coerced :: errs)
