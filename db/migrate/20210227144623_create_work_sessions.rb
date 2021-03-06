class CreateWorkSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :work_sessions do |t|
      t.datetime :start
      t.datetime :end
      t.integer :keys
      t.integer :backspace
      t.datetime :last_key
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
