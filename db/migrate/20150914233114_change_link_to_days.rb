class ChangeLinkToDays < ActiveRecord::Migration
  def change
    add_column :days, :url, :string
    remove_column :days, :link_to, :string
  end
end
