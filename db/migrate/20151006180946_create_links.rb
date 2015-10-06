class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :text
      t.string :url
      t.integer :activity_id

      t.timestamps null: false
    end
  end
end
