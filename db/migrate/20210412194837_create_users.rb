class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email
      t.string :password_digest
      t.text :description

      t.timestamps
    end
  end
end
