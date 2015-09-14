class RemoveColumnActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :start_time, :string
    remove_column :activities, :end_time, :string

  end
end
