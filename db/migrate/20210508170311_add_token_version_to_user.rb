class AddTokenVersionToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :token_version, :bigint, default: 0
  end
end
