class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :commentable, polymorphic: true
    has_many :comments, as: :commentable

    attribute :commenter_name, :string




    # after_initialize do |comment|
    #     comment.commenter_name = current_user.first_name
    # end
    
end
