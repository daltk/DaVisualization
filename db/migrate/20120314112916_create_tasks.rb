class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.datetime :deadline
      t.string :status

      t.timestamps
    end
  end
end
