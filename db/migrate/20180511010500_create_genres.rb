class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end
    add_column :items, :genre_id, :string
  end
end
