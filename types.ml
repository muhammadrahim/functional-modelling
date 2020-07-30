open Async

type product_code = ProductCode of string
type person = { first: string; last: string }
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
type payment_error = CardTypeNotRecognised | PaymentRejected | PaymentProviderOffline
type success = Success of bool 
type failure = Failure of bool 
type pay_invoice = unpaid_invoice -> payment -> (paid_invoice, payment_error) result
type customer = Customer
type save_customer = customer -> unit
type customer_id = CustomerId of int
(* -----------new chapter around here------------- *)
type widget_code = WidgetCode of string
type gizmo_code = GizmoCode of string
type unit_quantity = UnitQuantity of int
type kilogram_quantity = KilogramQuantity of float
type undefined = exn

type customer_info = undefined
type shipping_address = undefined
type billing_address = undefined
type order_line = undefined
type amount_to_bill = undefined

type order = { 
  customer_info: customer_info;
  shipping_address: shipping_address;
  billing_address: billing_address;
  orderlines: order_line list;
  amount_to_bill: amount_to_bill
}

type product_code = Widget of widget_code | Gizmo of gizmo_code
type order_quantity = 
  | UnitQuantity of unit_quantity 
  | KilogramQuantity of kilogram_quantity

type unvalidated_order = undefined
type validated_order = undefined
type validation_error = { field_name: string; error_description: string }
type validate_order = unvalidated_order -> ((validated_order, validation_error list) result) async

type acknowledgement_sent = undefined
type order_placed = undefined
type billable_order_placed = undefined
type place_order_events = {
  acknowledgement_sent : acknowledgement_sent;
  order_placed : order_placed;
  billable_order_placed : billable_order_placed
}

type place_order = unvalidated_order -> place_order_events

type quote_form = undefined
type order_form = undefined
type envelope_contents = EnvelopeContents of string
type categorized_mail = Quote of quote_form | Order of order_form
type categorize_inbound_mail = envelope_contents -> categorized_mail

type product_catalog = undefined
type priced_order = undefined
type calculate_prices = order_form -> product_catalog -> priced_order