class Schedule < ApplicationRecord
  belongs_to :movie
  def duration
    total_minutes = (end_time - start_time) / 60
    hours = (total_minutes / 60).floor
    minutes = (total_minutes % 60).round
    "#{hours}時間 #{minutes}分"
  end
end
