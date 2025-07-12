module ApplicationHelper
  def format_date_brazilian(date)
    return nil unless date
    date.strftime('%d/%m/%Y')
  end

  def format_date_brazilian_with_month_name(date)
    return nil unless date
    date.strftime('%d de %B de %Y')
  end
end
