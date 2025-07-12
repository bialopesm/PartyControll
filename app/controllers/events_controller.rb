class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to dashboard_path, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html {
          @events = Event.all.order(created_at: :desc)
          @new_event = @event
          render 'pages/dashboard', status: :unprocessable_entity
        }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to dashboard_path, status: :see_other, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Convert Brazilian date format (dd/mm/yyyy) to Rails format (yyyy-mm-dd)
    def convert_brazilian_date(date_string)
      return nil if date_string.blank?

      # Check if it's already in Rails format (yyyy-mm-dd)
      if date_string.match(/^\d{4}-\d{2}-\d{2}$/)
        return date_string
      end

      # Convert from Brazilian format (dd/mm/yyyy) to Rails format (yyyy-mm-dd)
      if date_string.match(/^\d{2}\/\d{2}\/\d{4}$/)
        parts = date_string.split('/')
        return "#{parts[2]}-#{parts[1]}-#{parts[0]}"
      end

      return nil
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params_hash = params.require(:event).permit(:name, :date, :place, :description, :status, :supplier, :event_type)

      # Convert date format if present
      if params_hash[:date].present?
        params_hash[:date] = convert_brazilian_date(params_hash[:date])
      end

      params_hash
    end
end
