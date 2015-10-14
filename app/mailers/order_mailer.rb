class OrderMailer < ApplicationMailer
  def new_order_to_tastehome(order)
    @order = order
    mail to: "order@buildub.com",
    subject: "Order has arrived"
  end
  
  def new_order_to_customer(order)
    @order = order
    mail to: @order.email,
    subject: "Order received!"
  end
end
