require 'stripe'

class ChargesController < ApplicationController

    skip_before_action :authorized

    # def new
    # end
    
    def create

        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                price_data: {
                    unit_amount: 2000,
                    currency: 'usd',
                    product_data: {
                        name: 'Stubborn Attachments',
                        images: ['https://i.imgur.com/EHyR2nP.png'],
                    },
                },
                quantity: 1,
                }],
                mode: 'payment',
                success_url: "http://localhost:3001/checkout" + '?success=true',
                cancel_url: "http://localhost:3001/checkout" + '?canceled=true',
                })
                render json: {id: session.id}
    end
    
end
        # Stripe.api_key = ENV['STRIPE_SECRET_KEY']


        # byebug
        # Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        # begin
            
        #     customer = Stripe::Customer.create(
        #         email => "svg145@gmail.com",
        #         :source => params[:charge][:token]
        #     )

        #     charge = Stripe::Charge.create({
        #         :customer => customer.id,
        #         :amount => "2000",
        #         :description => "dance class",
        #         :currency => "usd",
        #     })

        #     rescue Stripe::CardError => e
        #         render json: { message: 'card error' }, status: :not_acceptable
        #     end