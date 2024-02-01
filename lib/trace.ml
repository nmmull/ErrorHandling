type error = Trace_intf.error

module E = struct
  type t = error list
end

include Etude.Result.Make (E)
