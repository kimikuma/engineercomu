class Relationship < ApplicationRecord

  has_many :followed,class_name: "User"
  has_many :follower,class_name: "User"
end
