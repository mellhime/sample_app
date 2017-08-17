class AddUserToAnimeLists < ActiveRecord::Migration
  def change
    add_reference :anime_lists, :user, index: true
  end
end
