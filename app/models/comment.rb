class Comment < ApplicationRecord
    belongs_to :dance_class
    has_many :likes
end
