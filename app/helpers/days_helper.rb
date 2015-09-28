module DaysHelper
  def date_to_s(date)
    "#{date.strftime('%B')} #{date.day.ordinalize}, #{date.year}"
  end

  def date_class(day)
    if day.past?
      "past"
    elsif day.today?
      "today"
    else
      "future"
    end
  end
end
