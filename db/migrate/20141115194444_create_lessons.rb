class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :lesson_text
      t.string :instructions
      t.string :boilerplate_code

      t.timestamps
    end
  end
end
