class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :url
      t.string :body
      t.datetime :start
      t.datetime :end
      t.integer :day_id

      t.timestamps null: false
    end
    add_index :activities, :day_id
  end
end
