class AddUserToJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :user
  end
end
