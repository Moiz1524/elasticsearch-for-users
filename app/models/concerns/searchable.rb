require "elasticsearch"
require "elasticsearch/model"

Elasticsearch::Model.client = Elasticsearch::Client.new(
  cloud_id: Rails.application.credentials.dig(:elasticsearch, :cloud_id),
  api_key: Rails.application.credentials.dig(:elasticsearch, :api_key)
)

module Searchable
  extend ActiveSupport::Concern
  
  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :first_name, type: :text
      indexes :last_name, type: :text
      indexes :username, type: :text
      indexes :email, type: :text
      indexes :phone_no, type: :text
    end
  end


  def self.search(query)
    # Search logic goes here ...
    self.__elasticsearch__.search(query)
  end
end