class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id,uniqueness: {scope: :post_id}

 after_create do
   notifications.create(user_id: post.user_id)
 end

end

