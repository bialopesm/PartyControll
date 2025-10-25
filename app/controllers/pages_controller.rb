class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @events = Event.all.order(created_at: :asc)
    @dashboard ||= Event.new
  end
end
