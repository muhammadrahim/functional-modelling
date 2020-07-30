type product_code = ProductCode of string
type person = { first: string; last: string }
type order_quantity = UnitQuantity of int | KilogramQuantity of float
type check_number = CheckNumber of int
type card_number = CardNumber of string
type card_type = Visa | Mastercard
type credit_card_info = {
  card_type : card_type;
  card_number : card_number;
}
type payment_method = Cash | Check of check_number | Card of credit_card_info
type payment_amount = PaymentAmount of float
type currency = GBP | EUR
type payment = {
  amount: payment_amount;
  currency : currency;
  payment_method : payment_method;
  }
type unpaid_invoice = UnpaidInvoice
type paid_invoice = PaidInvoice
type invoice = unpaid_invoice -> payment -> paid_invoice
type currency_conversion = payment -> currency -> payment
type personal_name = {
  first_name : string;
  middle_name : string option;
  last_name : string;
}

let test : credit_card_info = { card_type = Visa; card_number = CardNumber "1" }

let anOrderInUnits = UnitQuantity 1
let anOrderInKg = KilogramQuantity 10.
let printQty aOrderQty = match aOrderQty with
  | UnitQuantity uQty ->  Printf.printf "%i units" uQty
  | KilogramQuantity kgQty -> Printf.printf "%g units" kgQty 
 
