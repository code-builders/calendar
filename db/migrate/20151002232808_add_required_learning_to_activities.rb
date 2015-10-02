class AddRequiredLearningToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :required_learning, :boolean, default: false
  end
end
