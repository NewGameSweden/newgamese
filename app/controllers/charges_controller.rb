class ChargesController < ApplicationController
  def new
  end

  def create

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:stripeAmount],
      :description => 'Newgame.se Stripe customer',
      :currency    => 'sek'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
