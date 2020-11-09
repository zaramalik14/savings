class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.integer :target_id
      t.integer :saving_id

      t.timestamps
    end
  end
end
