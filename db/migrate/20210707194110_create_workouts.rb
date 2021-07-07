class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :note
      t.datetime :workout_date
      t.integer :reps
      t.integer :sets
      t.string :exercise
      t.integer :weight
      t.belongs_to :user, foreign_key: true
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end

