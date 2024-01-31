type error = [
  | Bar_intf.error
  | Foo_intf.error
  ]

let individual_message =
  function | #Bar_intf.error as e -> Bar_intf.message e
           | #Foo_intf.error as e -> Foo_intf.message e

let message lst =
  let module_name s = "Trace.ml: \n" ^ s in
  let messages =
    Prelude.String.join
      ~sep:"\n"
      (List.map individual_message lst)
  in
  module_name messages
  
let print_result res =
  let message_result res =
    let open Stdlib.Result in
    map_error message res
  in
  match message_result res with
  | Ok n -> print_endline (string_of_int n)
  | Error msg -> print_endline msg
