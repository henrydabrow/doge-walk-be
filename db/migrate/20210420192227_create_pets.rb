class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets, id: :uuid do |t|
      t.string :name, null: false
      t.bigint :kind, null: false
      t.bigint :breed
      t.datetime :birthdate
      t.text :description
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
