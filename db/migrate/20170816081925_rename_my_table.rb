class RenameMyTable < ActiveRecord::Migration
  def change
  	rename_table :anime, :animes
  end
end
