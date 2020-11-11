class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postage, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, default:0, null: false
      t.integer :status, default:0, null: false, limit: 1 #鈴木追加分、db:migrate済み
      t.timestamps
    end
  end
end
