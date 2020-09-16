class User < ApplicationRecord
    has_many :user_classes
    has_many :dance_classes
    has_many :joined_classes, through: :user_classes, :source => :dance_class
end
