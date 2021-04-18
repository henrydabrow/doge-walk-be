class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:email], unique: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :postal_code, :string
    add_column :users, :gender, :string
  end
end
