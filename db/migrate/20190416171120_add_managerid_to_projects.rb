class AddManageridToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :managerid, :integer
  end
end
