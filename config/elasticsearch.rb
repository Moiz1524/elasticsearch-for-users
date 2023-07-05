require "elasticsearch"

client = Elasticsearch::Client.new(
  cloud_id: Rails.application.credentials.dig(:elasticsearch, :cloud_id),
  api_key: Rails.application.credentials.dig(:elasticsearch, :api_key)
)

