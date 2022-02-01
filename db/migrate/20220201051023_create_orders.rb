class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :address_name
      t.integer :payment_method
      t.integer :postage
      t.integer :payment

      t.timestamps
    end
  end
end
