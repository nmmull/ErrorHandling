type error = [
  | `NotGood of string
  ]

let message =
  let module_name s = "Foo.ml: " ^ s in
  function | `NotGood s ->
              module_name ("NotGood: " ^ s)
