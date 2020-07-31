type widget_code = WidgetCode of string
type gizmo_code = GizmoCode of string

module UnitQuantity = struct
  type t = int
  let create value: t = if value < 0 || value > 1000 
    then failwith (Printf.sprintf "Not in interval")
else value
end

type unit_quantity = UnitQuantity
type kilogram_quantity = KilogramQuantity of float
type product_code = Widget of widget_code | Gizmo of gizmo_code
type order_quantity = 
  | UnitQuantity of unit_quantity
  | KilogramQuantity of kilogram_quantity

let test = UnitQuantity.create 1

type undefined = exn

type order_id = undefined
type order_line_id = undefined
type customer_id = undefined

type customer_info = undefined
type shipping_address = undefined
type billing_address = undefined
type price = undefined
type order_line = undefined
type amount_to_bill = undefined

type ('a) non_empty_list = {
  first: 'a;
  rest: 'a list
}

type order = { 
  id: order_id;
  customer_id : customer_id;
  shipping_address: shipping_address;
  billing_address: billing_address;
  orderlines: order_line non_empty_list;
  amount_to_bill: amount_to_bill
}
and order_line = {
  order_line_id : order_line_id;
  order_id : order_id;
  product_code: product_code;
  order_quantity : order_quantity;
  price : price
}

type unvalidated_order = {
  order_id : string;
  customer_info : customer_info;
  shipping_address : shipping_address
}
type place_order_error = | ValidationError of validation_error list
and validation_error = { field_name: string; error_description: string }
type validated_order = undefined
type ('a) validation_response = (validated_order, validation_error list) result
type validate_order = unvalidated_order -> (validated_order) validation_response

type acknowledgement_sent = undefined
type order_placed = undefined
type billable_order_placed = undefined
type place_order_events = {
  acknowledgement_sent : acknowledgement_sent;
  order_placed : order_placed;
  billable_order_placed : billable_order_placed
}

type place_order = unvalidated_order -> (place_order_events, place_order_error) result

type quote_form = undefined
type order_form = undefined
type envelope_contents = EnvelopeContents of string
type categorized_mail = Quote of quote_form | Order of order_form
type categorize_inbound_mail = envelope_contents -> categorized_mail

type product_catalog = undefined
type priced_order = undefined
type calculate_prices = order_form -> product_catalog -> priced_order

type contact_id = ContactId of int
type phone_number = undefined
type email_address = undefined
type verified_email_address = undefined

type customer_email = Unverified of email_address | Verified of verified_email_address
type customer_address = CustomerAddress of string
type both_contact_methods = { email: verified_email_address; address: customer_address }

type contact_info = 
  | EmailOnly of verified_email_address
  | AddrOnly of customer_address
  | EmailAndAddr of both_contact_methods

type contact = {
  contact_id : contact_id;
  contact_info : contact_info
}