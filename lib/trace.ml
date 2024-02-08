module Errlist = Trace_intf.Errlist

module type TRACE = Trace_intf.TRACE

module Hide =
  struct
    type 'a trace = ('a, Trace_intf.Errlist.t) result
    let coerce e = (e : [< Trace_intf.global_error ]
                        :> Trace_intf.global_error)
    let new_error e =
      Error [coerce e]
    let trycatch e = function
      | Ok _ as o -> o
      | Error lst -> Error (coerce e :: lst)
  end

let export = Fun.id
