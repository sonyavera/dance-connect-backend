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

    private

    def dance_class_params
        params.require(:dance_class).permit(:user_id, :release_date, :style)
    end
end
