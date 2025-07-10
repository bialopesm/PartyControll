class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @events = Event.all.order(created_at: :desc)
    @new_event ||= Event.new
  end
end
