class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :addr
      t.string :time
      t.string :email
      t.string :phone
      t.string :special
      t.string :summary

      t.timestamps null: false
    end
  end
end
