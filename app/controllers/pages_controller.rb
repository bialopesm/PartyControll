class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @events = Event.all.order(created_at: :asc)
    @new_event ||= Event.new
  end
end
