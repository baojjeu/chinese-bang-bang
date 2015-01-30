class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admi, :boolean, default: false
  end
end
