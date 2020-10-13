require 'stripe'
Stripe.api_key = ENV['STRIPE_SECRET_KEY']


class ChargesController < ApplicationController

    skip_before_action :authorized

    # def new
    # end
    
    def create
        dance_class = DanceClass.find_by_id(params[:class_id])
        # $user_id = current_user.id
        # $dance_class_id = dance_class.id
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
                success_url: "http://localhost:3001/me/purchases/" + "#{params[:class_id]}" + '?success=true',
                # success_url: "http://localhost:3001/home/student" + '?success=true',
                cancel_url: "http://localhost:3001/me/purchases" + '?canceled=true',
                client_reference_id: "#{current_user.id}",
                metadata: {class_id: "#{params[:class_id]}"}
            })
        render json: {id: session.id}
    end

    def webhook
        endpoint_secret = ENV['STRIPE_ENDPOINT_SECRET']
        event = nil

        # Verify webhook signature and extract the event
        # See https://stripe.com/docs/webhooks/signatures for more information.
        begin
            sig_header = request.env['HTTP_STRIPE_SIGNATURE']
            payload = request.body.read
            event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
        rescue JSON::ParserError => e
            # Invalid payload
            return status 400
        rescue Stripe::SignatureVerificationError => e
            # Invalid signature
            return status 400
        end

        if event['type'] == 'checkout.session.completed'
            checkout_session = event['data']['object']
            # whats going on here
            fulfill_order(checkout_session)
          end

        # Print out the event so you can look at it
        puts event.inspect

        status 200
    end

    def fulfill_order(checkout_session)
        # UserClass.create(user_id: $user_id, dance_class_id: $dance_class_id)
        UserClass.create(user_id: checkout_session.client_reference_id, dance_class_id: checkout_session.metadata.class_id)

        # TODO: fill in with your own logic
        puts "Fulfilling order for #{checkout_session.inspect}"
    end
    
end