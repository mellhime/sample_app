class CreateAnimeLists < ActiveRecord::Migration
  def change
    create_table :anime_lists do |t|
      t.string :name
      t.integer :score
      t.integer :progress

      t.timestamps
    end
  end
end
