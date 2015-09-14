class ChangeTimeActivities < ActiveRecord::Migration
  def change
    change_column :activities, :start_time, :string
    change_column :activities, :end_time, :string

  end
end
