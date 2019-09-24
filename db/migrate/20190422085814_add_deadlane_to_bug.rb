class AddDeadlaneToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :deadlane, :date
  end
end
