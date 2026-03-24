module ApplicationHelper
  def format_date_brazilian(date)
    return nil unless date
    date.strftime('%d/%m/%Y')
  end

  def format_date_brazilian_with_month_name(date)
    return nil unless date
    date.strftime('%d de %B de %Y')
  end

  def calendar_month_title_pt(month_date)
    months = %w[janeiro fevereiro março abril maio junho julho agosto setembro outubro novembro dezembro]
    "#{months[month_date.month - 1]} de #{month_date.year}"
  end

  def calendar_weeks(month_date)
    first = month_date.beginning_of_month
    last = month_date.end_of_month
    start_date = first.beginning_of_week(:monday)
    end_date = last.end_of_week(:monday)
    (start_date..end_date).to_a.in_groups_of(7)
  end

  def calendar_month_select_options
    months_pt = %w[janeiro fevereiro março abril maio junho julho agosto setembro outubro novembro dezembro]
    months_pt.each_with_index.map { |name, i| [name.capitalize, i + 1] }
  end

  def calendar_year_select_options
    y = Date.current.year
    ((y - 15)..(y + 30)).to_a
  end
end
