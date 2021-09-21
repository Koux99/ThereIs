class Post < ApplicationRecord
  
  with_options  presence: true do
    validates    :title
    validates    :lead_text
    validates    :text
    validates    :image
  end
  
  belongs_to         :user
  has_many           :comments,  dependent: :destroy
  has_many           :likes,     dependent: :destroy
  has_one_attached   :image

  def self.search(search)
    if search != ""
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

end
