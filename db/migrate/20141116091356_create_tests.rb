class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.string :test_type
      t.string :arg_a
      t.string :arg_b
      t.integer :lesson_id

      t.timestamps
    end
  end
end
