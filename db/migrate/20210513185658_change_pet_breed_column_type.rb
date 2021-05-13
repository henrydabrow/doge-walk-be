class ChangePetBreedColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :pets, :breed, :string
  end
end
