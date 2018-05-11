class Item < ApplicationRecord
  validates_presence_of :title, :location, :date, :intro

  belongs_to :genre, optional: true
  # 加上optional: true，讓item可以不用有genre_id也能存在
end
