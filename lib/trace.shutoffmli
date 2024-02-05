type error = Trace_intf.error

include Etude.Endofunctors_intf.MONAD
        with type 'a t := ('a, error list) result

type ('a, +'error) t

(* val trycatch : 'error -> ('a, 'error) t -> ('a, 'error) t *)
