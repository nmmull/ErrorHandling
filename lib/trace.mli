type error = Trace_intf.error

include Etude.Endofunctors_intf.MONAD
        with type 'a t := ('a, error list) result

