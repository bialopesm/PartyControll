json.extract! event, :id, :name, :date, :place, :description, :status, :supplier, :created_at, :updated_at
json.url event_url(event, format: :json)
