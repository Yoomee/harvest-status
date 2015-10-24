class AddNotesToTimers < ActiveRecord::Migration
  def change
    add_column :timers, :notes, :string
  end
end
