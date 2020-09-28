class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :username, :account_type, :first_name, :last_name, :id, :avatar



  def avatar 
    rails_blob_path(object.avatar, disposition: 'attachment', only_path: true) if object.avatar.attached?
  end 

end
