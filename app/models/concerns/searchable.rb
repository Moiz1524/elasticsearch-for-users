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