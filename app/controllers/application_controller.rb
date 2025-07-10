class ApplicationController < ActionController::Base
  # Devise redirect methods
  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_up_path_for(resource)
    dashboard_path
  end
end
