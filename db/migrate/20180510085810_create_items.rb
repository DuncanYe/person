class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :date
      t.string :location
      t.text :intro

      t.timestamps
    end
  end
end
