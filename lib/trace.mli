type ('a, 'e, 'w) t

val pure : 'a -> ('a, 'e, 'w) t

val throw : ?serializer:('e -> 'w) -> 'e -> (unit, 'e, 'w) t

val bind : ('a, 'e, 'w) t -> ('a -> ('b, 'e, 'w) t) -> ('b, 'e, 'w) t

val catch : ('a, 'e, 'w) t -> ('e -> ('a, 'f, 'w) t) -> ('a, 'f, 'w) t

val withError : ?serializer:('f -> 'w) -> 'f -> ('a, 'e, 'w) t -> ('a, 'f, 'w) t
