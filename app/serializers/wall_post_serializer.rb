class WallPostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :postMsg, :username
end
