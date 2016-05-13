class AddAvatarToHaunts < ActiveRecord::Migration[5.0]
  def change
    add_column :haunts, :avatar, :string
  end
end
