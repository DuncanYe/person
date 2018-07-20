class Register < ApplicationRecord
  validates :content, presence: true
  belongs_to :user, counter_cache: true
  belongs_to :item, counter_cache:  true
end
