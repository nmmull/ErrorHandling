type error = Trace_intf.error

type ('a, 'b, 'c) full_error = ('a, 'b, 'c) Trace_intf.full_error

val pure : 'a -> ('a, 'b) result * 'c list

val throw : error -> ('a, error) result * [> error ] list

val bind : ('a, 'b, 'c) full_error ->
           ('a -> ('d, 'b, 'c) full_error) ->
           ('d, 'b, 'c) full_error

val withError : error ->
                ('a, 'b, ([> error ] as 'c)) full_error ->
                ('a, error, 'c) full_error
