class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_many :comments
    # validates :username, uniqueness: { case_sensitive: false }


    has_many :user_classes
    has_many :dance_classes
    has_many :joined_classes, through: :user_classes, :source => :dance_class
end
