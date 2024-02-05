module E = struct
  type error = Foo_intf.error
  let plunk narrow_error = function
    | _, lst ->
       let coerced =
         (narrow_error : error :> Trace_intf.error)
       in Some narrow_error, coerced :: lst
end

  (* let plunk new_hd (old_hd, lst) =
   *   let coerced =
   *     (old_hd : error :> Trace_intf.error)
   *   in (new_hd, coerced :: lst) *)

(* module R = Trace.Make (E)
 * 
 * let is_two_or_error x =
 *   if x = 2
 *   then R.pure x
 *   else R.new_error (`NotGood "Not given 2") *)
