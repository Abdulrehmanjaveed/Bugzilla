class RemoveDeadlineFromBugs < ActiveRecord::Migration[5.2]
  def change
    remove_column :bugs, :deadline, :string
  end
end
