class AddRegistersCountToUseAndUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :registers_count, :integer, default: 0
    add_column :items, :registers_count, :integer, default: 0
  end
end
