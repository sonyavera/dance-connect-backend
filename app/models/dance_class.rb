class DanceClass < ApplicationRecord
    include Rails.application.routes.url_helpers

    has_one_attached :image
    attribute :instructor_name, :string
    attribute :instructor_avatar, :string
    attribute :uploaded_avatar, :string

    belongs_to :user

    has_many :user_classes
    has_many :users, through: :user_classes

    has_many :comments
    has_many :likes, through: :comments


    after_initialize do |dance_class|
        dance_class.instructor_name = user.first_name + " " + user.last_name
        dance_class.instructor_avatar = user.seeds_avatar
        if user.avatar.attached?
            blob = rails_blob_path(user.avatar, disposition: 'attachment', only_path: true)
        # dance_class.uploaded_avatar = rails_blob_path(user.avatar, disposition: 'attachment', only_path: true) if user.avatar.attached?
            dance_class.uploaded_avatar = blob
        end
        # dance_class.uploaded_avatar = user.avatar

    end


        

end
