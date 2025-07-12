module EventsHelper
  def status_color(status)
    case status&.downcase
    when 'planejamento'
      'warning'
    when 'confirmado'
      'success'
    when 'em andamento'
      'info'
    when 'concluído'
      'primary'
    when 'cancelado'
      'danger'
    else
      'secondary'
    end
  end
end
