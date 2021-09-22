class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,    presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  
  has_many  :posts
  has_many  :comments
  has_many  :likes,     dependent: :destroy

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

end
