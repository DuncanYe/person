class Genre < ApplicationRecord
  has_many :items
  # 如想要刪除該Genre時，底下的items也一並刪除，加入dependent: :destroy， 
end
