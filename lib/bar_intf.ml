type error = [
  | `BadBad of string
  ]

let message =
  let module_name s = "Bar.ml: " ^ s in
  function | `BadBad s ->
              module_name ("BadBad: " ^ s)
