class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.integer :amount
      t.string :by_doing
      t.string :instead_of
      t.string :category
      t.datetime :day_created

      t.timestamps
    end
  end
end
