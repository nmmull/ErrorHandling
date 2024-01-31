module E = struct
  type t = Trace_intf.error list
end

include Etude.Result.Make (E)

let message = Trace_intf.message
let print_result = Trace_intf.print_result

let trycatch e x =
  match x with
  | Ok _ -> x
  | Error errs -> Error (e :: errs)
