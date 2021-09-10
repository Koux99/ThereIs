class Post < ApplicationRecord
  
with options  presence: true do
    validates    :title
    validates    :lead_text
    validates    :text
    validates    :image
end
  
  belongs_to         :user
  has_one_attached   :image
end
