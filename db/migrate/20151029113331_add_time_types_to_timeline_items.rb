class AddTimeTypesToTimelineItems < ActiveRecord::Migration
  def change
    add_column :timeline_items, :investment_time, :float
    add_column :timeline_items, :client_time, :float
    add_column :timeline_items, :support_time, :float
    add_column :timeline_items, :biz_dev_time, :float
    change_column :timeline_items, :hours,  :float
  end
end
