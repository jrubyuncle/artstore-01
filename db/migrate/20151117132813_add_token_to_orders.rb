class AddTokenToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :token, :integer
    add_index  :orders, :token
  end
end
