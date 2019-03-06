class GameSerializer < ActiveModel::Serializer
  attributes :id, :distance, :avg_velocity
  belongs_to :user
end
