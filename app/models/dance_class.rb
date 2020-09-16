class DanceClass < ApplicationRecord
    belongs_to :user

    has_many :user_classes
    has_many :users, through: :user_classes

    has_many :comments
    has_many :likes, through: :comments
end
