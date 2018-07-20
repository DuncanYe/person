class Register < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :item
end