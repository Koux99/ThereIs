class Post < ApplicationRecord
  
with_options  presence: true do
    validates    :title
    validates    :lead_text
    validates    :text
    validates    :image
end
  
  belongs_to         :user
  has_many           :comments,  dependent: :destroy
  has_many           :likes
  has_one_attached   :image
end
