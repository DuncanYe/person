class Item < ApplicationRecord
  validates_presence_of :title, :location, :date, :intro
end
