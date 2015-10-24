class CreateTimelineItems < ActiveRecord::Migration
  def change
    create_table :timeline_items do |t|
      t.integer :timer_id
      t.integer :project_id
      t.integer :user_id
      t.integer :task_id
      t.integer :client_id
      t.integer :harvest_id
      t.integer :hours
      t.string :notes
      t.timestamps
    end
  end
end
