class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites,dependent: :destroy

  validates :content,presence: true,length: {maximum:30}
  validates :user_id,uniqueness: {scope: :post_id}

 def favorite?(user)
   favorites.exists?(user_id: user.id)
 end

end
