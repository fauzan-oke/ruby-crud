class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.integer :employeeID
      t.date :date
      t.integer :value

      t.timestamps
    end
  end
end
