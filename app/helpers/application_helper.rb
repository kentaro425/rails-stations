module ApplicationHelper
  def custom_date_select(form, method, options = {})
    start_date = options.delete(:start_date) || Date.today
    end_date = options.delete(:end_date) || Date.today + 6.days

    range = start_date..end_date
    dates = range.map { |date| [date.strftime('%Y-%m-%d'), date] }

    form.select method, options_for_select(dates), options
  end

  def formatted_start_time(schedule)
    schedule.start_time.strftime('%H:%M')
  end
end
