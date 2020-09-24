class DanceClass < ApplicationRecord
    attribute :instructor_name, :string
    attribute :instructor_avatar, :string

    belongs_to :user

    has_many :user_classes
    has_many :users, through: :user_classes

    has_many :comments
    has_many :likes, through: :comments


    after_initialize do |dance_class|
        dance_class.instructor_name = user.first_name + " " + user.last_name
        dance_class.instructor_avatar = user.avatar
    end
end
