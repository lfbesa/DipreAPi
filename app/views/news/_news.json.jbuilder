json.extract! news, :id, :title, :description, :publishedAt, :source, :urlToImage, :url, :created_at, :updated_at
json.url news_url(news, format: :json)
