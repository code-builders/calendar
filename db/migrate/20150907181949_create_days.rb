class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.column :date, :datetime
      t.column :description, :string
      t.column :link_to, :string

      t.timestamps
    end
  end
end
