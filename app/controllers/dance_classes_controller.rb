class DanceClassesController < ApplicationController
    include Rails.application.routes.url_helpers

    skip_before_action :authorized

    def index
        dance_classes = DanceClass.all
        render json: { classes: dance_classes }
    end

    def create
        dance_class = current_user.dance_classes.create(dance_class_params)
        # dance_class.avatar.attach(dance_class_params[:avatar])
        # dance_class.uploaded_avatar = url_for(dance_class.uploaded_avatar)
        render json: { dance_class: dance_class }, status: :created
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

    def unique_classes
        unique_array = DanceClass.all.uniq{|dance_class| dance_class.instructor_avatar}
        render json: { unique_dance_class_array: unique_array}
    end

    private

    def dance_class_params
        params.require(:dance_class).permit(:user_id, :date, :style, :level, :description, :url, :price)
    end
end
