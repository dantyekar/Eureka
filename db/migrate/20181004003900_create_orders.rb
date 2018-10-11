class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.column :status, :integer, default: 0
    end
  end
end