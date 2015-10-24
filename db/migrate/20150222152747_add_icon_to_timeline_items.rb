class AddIconToTimelineItems < ActiveRecord::Migration
  def change
    add_column :timeline_items, :icon, :string
  end
end
