let pure x = Ok x

let trycatch e x =
  match x with
  | Ok _ -> x
  | Error errs -> Error (e :: errs)
