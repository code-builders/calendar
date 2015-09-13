class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.time :start_time
      t.time :end_time
      t.string :text
      t.string :link

    end
  end
end
