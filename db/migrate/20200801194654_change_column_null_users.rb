class ChangeColumnNullUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :provider, null: false, default: ""
    change_column_null :users, :uid, null: false, default: ""
  end
end
