class DanceClassesController < ApplicationController
    skip_before_action :authorized

    def index
        dance_classes = DanceClass.all
        render json: { classes: dance_classes }
    end

    def create
        dance_class = current_user.dance_classes.create(dance_class_params)
        render json: { event: dance_class }, status: :created
    end

    def show
        dance_class = DanceClass.find([params[:id]])
        render json: {dance_class: dance_class}
    end

    def my_dance_classes
        purchased_dance_classes = current_user.joined_classes
        created_dance_classes = current_user.dance_classes
        render json: { purchased_dance_classes: purchased_dance_classes, created_dance_classes: created_dance_classes}
      end

    private

    def dance_class_params
        params.require(:dance_class).permit(:user_id, :release_date, :style)
    end
end
