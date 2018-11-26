json.extract! event, :id, :title, :description, :date, :epigraph, :toDate, :url, :hour, :created_at, :updated_at
json.url event_url(event, format: :json)
