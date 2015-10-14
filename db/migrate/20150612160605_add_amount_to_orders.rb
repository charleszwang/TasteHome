class AddAmountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :amount, :string
  end
end
