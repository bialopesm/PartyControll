module EventsHelper
  def status_color(status)
    case status&.downcase
    when 'planning'
      'warning'
    when 'confirmed'
      'success'
    when 'in progress'
      'info'
    when 'completed'
      'primary'
    when 'cancelled'
      'danger'
    else
      'secondary'
    end
  end
end
