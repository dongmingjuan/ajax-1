class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  def display_name
    self.email.split("@").first
  end

  has_many :likes, :dependent => :destroy

  has_many :liked_posts, :through => :likes, :source => :post

  def is_admin?
    role == "admin"
  end

end
