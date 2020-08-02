class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string, limit: 50, default: "", null: false
    add_column :users, :uid, :string, limit: 500, default: "", null: false
  end
end
