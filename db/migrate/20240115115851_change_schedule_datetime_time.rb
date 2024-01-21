class ChangeScheduleDatetimeTime < ActiveRecord::Migration[6.1]
  def change
    change_table :schedules do |t|
      t.change :start_time, :time
      t.change :end_time, :time
    end
  end
end
