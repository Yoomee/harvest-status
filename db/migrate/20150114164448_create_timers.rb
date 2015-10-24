class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :task_id
      t.integer :client_id
      t.integer :harvest_id
      t.integer :hours
      t.timestamps
    end
    change_column :timers, :hours, :decimal, :precision => 8, :scale => 2
  end
end
