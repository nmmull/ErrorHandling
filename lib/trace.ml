module E = struct
  type t = Trace_intf.error list
end

include Etude.Result.Make (E)

let trycatch e x =
  match x with
  | Ok _ -> x
  | Error errs -> Error (e :: errs)
