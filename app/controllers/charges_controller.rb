class ChargesController < ApplicationController

    def create

        Stripe.api_key = ENV['STRIPE_SECRET_KEY']

        order = Order.find(params[:orderId])
        amount = order.shoes.sum(:cost) * 100

        charge = Stripe::Charge.create(
            # :customer = > customer.id,
            :amount => amount,
            :description => 'OG STORE',
            :currency => 'usd',
            :source => params[:token]
        )

    rescue Stripe::CardErrors => e
        flash[:errors] = e.message
        redirect_to charges_path
end
