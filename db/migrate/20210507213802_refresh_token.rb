class RefreshToken < ActiveRecord::Migration[6.0]
  def change
    create_table :refresh_tokens, id: :uuid do |t|
      t.string :crypted_token, null: false
      t.bigint :version
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
