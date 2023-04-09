class UserSerializer < ActiveModel::Serializer
    attributes :name, :email, :password_digest, :created_at
end