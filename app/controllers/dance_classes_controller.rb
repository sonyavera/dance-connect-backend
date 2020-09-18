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
        instructor_id = dance_class[0].user_id
        instructor = User.find_by_id(instructor_id)
        render json: {dance_class: dance_class, instructor_first_name: instructor.first_name, instructor_last_name: instructor.last_name}
    end

    private

    def dance_class_params
        params.require(:dance_class).permit(:user_id, :release_date, :style)
    end
end
