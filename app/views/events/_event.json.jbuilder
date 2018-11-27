json.extract! event, :id, :title, :description, :date, :epigraph, :to_date, :url, :hour, :created_at, :updated_at
json.url event_url(event, format: :json)
