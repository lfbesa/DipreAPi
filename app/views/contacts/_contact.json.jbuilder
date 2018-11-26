json.extract! contact, :id, :email, :body, :subject, :created_at, :updated_at
json.url contact_url(contact, format: :json)
