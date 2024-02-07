type errlist = Trace_intf.errlist

module Make (C : Trace_intf.COERCE)
       : Trace_intf.TRACE with type error = C.error
  = struct
  type error = C.error
  let new_error e = Error [C.coerce e]
  let trycatch e = function
    | Ok _ as o -> o
    | Error lst -> Error (C.coerce e :: lst)
end
