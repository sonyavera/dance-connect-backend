require 'stripe'

class ChargesController < ApplicationController

    skip_before_action :authorized

    # def new
    # end
    
    def create
        dance_class = DanceClass.find_by_id(params[:class_id])
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                price_data: {
                    unit_amount: dance_class.price*100,
                    currency: 'usd',
                    product_data: {
                        name: dance_class.style + " with " + dance_class.instructor_name,
                        images: [dance_class.instructor_avatar],
                    },
                },
                quantity: 1,
                }],
                mode: 'payment',
                # success_url: "http://localhost:3001/me/purchases",
                success_url: "http://localhost:3001/me/purchases" + '?success=true',
                cancel_url: "http://localhost:3001/me/purchases" + '?canceled=true',
            })
        render json: {id: session.id}
    end
    
end