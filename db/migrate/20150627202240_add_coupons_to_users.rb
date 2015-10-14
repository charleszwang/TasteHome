class AddCouponsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coupon, :string
  end
end
