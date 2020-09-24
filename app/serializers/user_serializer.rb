class UserSerializer < ActiveModel::Serializer
  attributes :username, :account_type, :first_name, :last_name, :id, :avatar
end
