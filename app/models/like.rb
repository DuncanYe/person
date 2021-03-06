class Like < ApplicationRecord
  validates :item_id, uniqueness: { scope: :user_id }
  belongs_to :user, counter_cache: true
  belongs_to :item, counter_cache: true
end
