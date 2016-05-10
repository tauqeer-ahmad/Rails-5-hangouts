class AddFirstNameSurnameToHaunts < ActiveRecord::Migration[5.0]
  def change
    add_column :haunts, :first_name, :string
    add_column :haunts, :surname, :string
  end
end
