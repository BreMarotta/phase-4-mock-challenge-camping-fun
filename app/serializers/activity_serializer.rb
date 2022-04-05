class ActivitySerializer < ActiveModel::Serializer
  has_many :signups
    has_many :campers, through: :signups
    
  attributes :id, :name, :difficulty
end
