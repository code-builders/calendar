class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.column :date, :datetime
      t.string :description, :string
      t.column :link_to, :string
    end
  end
end
