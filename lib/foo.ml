let is_two_or_error x =
  let open Trace in
  if x = 2
  then Ok x
  else mk_error (`NotGood "Not given 2")

