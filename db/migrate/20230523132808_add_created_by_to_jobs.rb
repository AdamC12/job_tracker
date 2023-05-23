class AddCreatedByToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :created_by, :integer
  end
end
