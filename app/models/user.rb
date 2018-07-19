class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/       

  has_many :items
  has_many :comments, dependent: :destroy
  has_many :commented_items, through: :comments, source: :item

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item

  ROLE = {
    normal: '一般用戶',
    admin: '管理員'
  }

  def admin?
     self.role == "admin"
  end

  def followed?(user)
    self.followings.include?(user) 
  end 

end
