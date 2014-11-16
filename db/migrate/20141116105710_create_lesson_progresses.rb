class CreateLessonProgresses < ActiveRecord::Migration
  def change
    create_table :lesson_progresses do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.boolean :completed, default: false
      t.string :code

      t.timestamps
    end
  end
end
