class ChangeScheduleTimeToDatetime < ActiveRecord::Migration[6.1]
  def change
    change_table :schedules do |t|
      t.change :start_time, :datetime
      t.change :end_time, :datetime
    end
  end
end