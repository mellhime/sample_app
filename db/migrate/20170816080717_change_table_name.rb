class ChangeTableName < ActiveRecord::Migration
  def change
  	rename_table :anime_lists, :anime
  end
end
