class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.string :category
      t.string :goal
      t.string :gift

      t.timestamps
    end
  end
end
