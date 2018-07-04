class Item < ApplicationRecord
  validates_presence_of :title, :location, :date, :intro, :genre

  belongs_to :genre, optional: true
  # 加上optional: true，讓item可以不用有genre_id也能存在
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user


  def liked?(x)
    self.liked_users.include?(x)
  end

  def count_likes
    self.likes_count = self.likes.size
    self.save
  end

end
