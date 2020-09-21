class UserClassesController < ApplicationController

    def create
        current_user_id = current_user.id
        dance_class_id = user_class_params['dance_class_id']
        user_class = UserClass.create(user_id: current_user_id, dance_class_id: dance_class_id)
        render json: { user_class: user_class }, status: :created
    end

    private

    def user_class_params
        params.require(:user_class).permit(:dance_class_id)
    end
end
