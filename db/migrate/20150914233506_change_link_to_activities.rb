class ChangeLinkToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :url, :string
    remove_column :activities, :link, :string
  end
end
