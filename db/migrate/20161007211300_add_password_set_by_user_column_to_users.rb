class AddPasswordSetByUserColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_set_by_user, :boolean, default: true, null: false
  end
end
