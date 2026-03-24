class ApplicationController < ActionController::Base
  # Devise redirect methods
  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_sign_up_path_for(_resource)
    dashboard_path
  end

  private

  def parse_calendar_month
    if params[:calendar_month].present?
      return Date.strptime(params[:calendar_month].to_s, "%Y-%m")
    end

    if params[:calendar_year].present? && params[:calendar_month_num].present?
      y = params[:calendar_year].to_i
      m = params[:calendar_month_num].to_i
      return Date.new(y, m, 1)
    end

    Date.current.beginning_of_month
  rescue ArgumentError
    Date.current.beginning_of_month
  end

  def assign_dashboard_calendar
    @calendar_month = parse_calendar_month
    list = @events || Event.all.order(created_at: :asc)
    @events_by_date = list.group_by(&:date)
  end
end
