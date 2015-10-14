class ChargesController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = "sk_test_QlR8iLwIZ5qNNuTHzOIe1jNk"
    # live_change_here!!
    # Stripe.api_key = "sk_live_vJCXKMyqZ8kqMD2i0JyVa1od"

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => params[:amount], # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => "Tastehome food delivery"
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end
    OrderMailer.new_order_to_customer(@order).deliver_now
    OrderMailer.new_order_to_tastehome(@order).deliver_now
     
  end
  
  def index

  end
  
  def save
    @foodone = params[:foodone].to_i
    @foodtwo = params[:foodtwo].to_i
    @foodthree = params[:foodthree].to_i
    @totalnum = @foodone*1+@foodtwo*1+@foodthree*1
    @totalprice = ((7*@foodone + 7*@foodtwo + 8*@foodthree + 2.5)*100).to_i
    @foodsummary = "ChickenzMayo:zXz" + @foodone.to_s+";z" + "TunazMayo:zXz" + @foodtwo.to_s + ";z" + "PorkzBellyzRicezBowl:zXz" + @foodthree.to_s
  end
  
  def show
  end
  
  private
  def order_params
    p = Hash.new
    p["name"] = params[:name]
    p["email"] = params[:email]
    p["phone"] = params[:phone]
    p["summary"] = params[:summary].tr("z", " ")
    p["addr"] = params[:address]
    p["time"] = params[:time]
    p["special"] ||= params[:special]
    p["amount"] = params[:amount].to_i/100.00
    return p
  end
end