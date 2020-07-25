type t = { value : string }

type person = { first: string; last: string }
let aPerson : person = { first = "Alex"; last = "Adams"}
let last = aPerson.last

let { first=first_name; last=last_name; } = aPerson


class istack = object
  val aPerson : person = { first = "Alex"; last = "Adams"}
end

